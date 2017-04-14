//
//  DemoModel.swift
//  SOADemo
//
//  Created by a.y.zverev on 12.04.17.
//  Copyright © 2017 a.y.zverev. All rights reserved.
//

import UIKit
import Foundation

struct AppDisplayModel {
    let title: String
    let imageUrl: String
}

protocol IDemoModel {
    func loadNewApps(completionHandler: @escaping ([AppDisplayModel]?, String?) -> Void)
}

class DemoModel: IDemoModel {
    
    let requestSender: IRequestSender = RequestSender()
    
    func loadNewApps(completionHandler: @escaping ([AppDisplayModel]?, String?) -> Void) {
        
        let requestConfig: RequestConfig<[AppApiModel]> = RequestsFactory.AppleRSSRequests.newAppsConfig

        requestSender.send(config: requestConfig) { (apps: [AppApiModel]?) in
            var appDisplayModels: [AppDisplayModel]?
            if let apps = apps {
                appDisplayModels = apps.map({ AppDisplayModel(title: $0.name, imageUrl: $0.iconUrl) })
            }
            completionHandler(appDisplayModels, nil)
        }
    }

}
