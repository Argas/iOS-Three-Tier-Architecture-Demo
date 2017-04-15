//
//  DemoModel.swift
//  SOADemo
//
//  Created by a.y.zverev on 12.04.17.
//  Copyright © 2017 a.y.zverev. All rights reserved.
//

import UIKit
import Foundation

struct CellDisplayModel {
    let title: String
    let imageUrl: String
}

protocol IDemoModel: class {
    weak var delegate: IDemoModelDelegate? { get set }
    func fetchNewApps()
    func fetchTopTracks()
}

protocol IDemoModelDelegate: class {
    func setup(dataSource: [CellDisplayModel])
    func show(error message: String)
}

class DemoModel: IDemoModel {
    
    weak var delegate: IDemoModelDelegate?
    
    let appsService:  IAppsService
    let tracksService:  ITracksService
    
    init(appsService: IAppsService, tracksService: ITracksService) {
        self.appsService = appsService
        self.tracksService = tracksService
    }
    
    func fetchNewApps() {
        appsService.loadNewApps { (apps: [AppApiModel]?, error) in
            
            if let apps = apps {
                let cells = apps.map({ CellDisplayModel(title: $0.name, imageUrl: $0.iconUrl) })
                self.delegate?.setup(dataSource: cells)
            } else {
                self.delegate?.show(error: error ?? "Error")
            }
        }
    }
    
    func fetchTopTracks() {
        tracksService.loadTopTracks { (tracks: [TrackApiModel]?, errorMessage) in
            
            if let tracks = tracks {
                let cells = tracks.map({ CellDisplayModel(title: $0.name, imageUrl: $0.coverUrl) })
                self.delegate?.setup(dataSource: cells)
            } else {
                self.delegate?.show(error: errorMessage ?? "Error")
            }
        }
    }

}
