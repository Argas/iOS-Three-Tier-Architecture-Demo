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
    static var demoViewCotnroller: UIViewController {
        return DemoViewController(model: model)
    }
    
    // MARK: - PRIVATE SECTION
    
    private static var model: IDemoModel {
        return DemoModel(appsService: appService,
                         tracksService: tracksService())
    }
    
    private static func tracksService() -> ITracksService {
        return TracksService(requestSender: requestSender)
    }
    
    private static var appService: IAppsService {
        return AppsService(requestSender: requestSender)
    }
    
    private static var requestSender: IRequestSender {
        return RequestSender()
    }

}
