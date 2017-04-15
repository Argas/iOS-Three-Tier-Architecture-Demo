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

protocol IDemoModel {
    func fetchNewApps(completionHandler: @escaping ([CellDisplayModel]?, String?) -> Void)
    func fetchTopTracks(completionHandler: @escaping ([CellDisplayModel]?, String?) -> Void)
}

class DemoModel: IDemoModel {
    let appsService:  IAppsService
    let tracksService:  ITracksService
    
    init(appsService: IAppsService, tracksService: ITracksService) {
        self.appsService = appsService
        self.tracksService = tracksService
    }
    
    func fetchNewApps(completionHandler: @escaping ([CellDisplayModel]?, String?) -> Void) {
        appsService.loadNewApps { (apps: [AppApiModel]?, error) in
            let cells = apps?.map({ CellDisplayModel(title: $0.name, imageUrl: $0.iconUrl) })
            completionHandler(cells, error)
        }
        
    }
    
    func fetchTopTracks(completionHandler: @escaping ([CellDisplayModel]?, String?) -> Void) {        tracksService.loadTopTracks { (tracks: [TrackApiModel]?, errorMessage) in
            let cells = tracks?.map({ CellDisplayModel(title: $0.name, imageUrl: $0.coverUrl) })
            completionHandler(cells, errorMessage)
        }
    }

}
