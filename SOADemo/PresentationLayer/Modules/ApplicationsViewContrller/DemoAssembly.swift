//
//  DemoAssembly.swift
//  SOADemo
//
//  Created by a.y.zverev on 14.04.17.
//  Copyright © 2017 a.y.zverev. All rights reserved.
//

import Foundation
import UIKit

class DemoAssembly {
    func demoViewCotnroller() -> DemoViewController {
        let model = demoModel()
        let demoVC = DemoViewController(model: model)
        model.delegate = demoVC
        return demoVC
    }
    
    // MARK: - PRIVATE SECTION
    
    private func demoModel() -> IDemoModel {
        return DemoModel(appsService: appService(),
                         tracksService: tracksService())
    }
    
    private func tracksService() -> ITracksService {
        return TracksService(requestSender: requestSender())
    }
    
    private func appService() -> IAppsService {
        return AppsService(requestSender: requestSender())
    }
    
    private func requestSender() -> IRequestSender {
        return RequestSender()
    }

}
