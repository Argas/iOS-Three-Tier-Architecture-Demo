//
//  ServicesAssembly.swift
//  SOADemo
//
//  Created by a.y.zverev on 04.04.2018.
//  Copyright © 2018 a.y.zverev. All rights reserved.
//

import Foundation

protocol IServicesAssembly {
    var tracksService: ITracksService { get }
    var appService: IAppsService { get }
}

class ServicesAssembly: IServicesAssembly {
    
    private let coreAssembly: ICoreAssembly
    
    init(coreAssembly: ICoreAssembly) {
        self.coreAssembly = coreAssembly
    }
    
    lazy var tracksService: ITracksService = TracksService(requestSender: self.coreAssembly.requestSender)
    lazy var appService: IAppsService = AppsService(requestSender: self.coreAssembly.requestSender)
}
