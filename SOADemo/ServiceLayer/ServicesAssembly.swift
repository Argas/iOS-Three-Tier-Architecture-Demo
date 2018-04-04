//
//  ServicesAssembly.swift
//  SOADemo
//
//  Created by a.y.zverev on 04.04.2018.
//  Copyright © 2018 a.y.zverev. All rights reserved.
//

import Foundation

class ServicesAssembly {
    
    private let coreAssembly: CoreAssembly
    
    init(coreAssembly: CoreAssembly) {
        self.coreAssembly = coreAssembly
    }
    
    lazy var tracksService = TracksService(requestSender: self.coreAssembly.requestSender)
    lazy var appService = AppsService(requestSender: self.coreAssembly.requestSender)
}
