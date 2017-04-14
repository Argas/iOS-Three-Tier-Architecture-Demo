//
//  File.swift
//  SOADemo
//
//  Created by a.y.zverev on 14.04.17.
//  Copyright © 2017 a.y.zverev. All rights reserved.
//

import Foundation

protocol IAppsService {
    func loadNewApps(completionHandler: @escaping ([AppDisplayModel]?, String?) -> Void)
}

class AppsService: IAppsService {
    
    let requestSender: IRequestSender

    init(requestSender: IRequestSender) {
        self.requestSender = requestSender
    }
    
    func loadNewApps(completionHandler: @escaping ([AppDisplayModel]?, String?) -> Void) {
        
        let requestConfig: RequestConfig<[AppApiModel]> = RequestsFactory.AppleRSSRequests.newAppsConfig
        
        requestSender.send(config: requestConfig) { (result: Result<[AppApiModel]>) in
            
            switch result {
            case .Success(let apps):
                let appDisplayModels = apps.map({ AppDisplayModel(title: $0.name, imageUrl: $0.iconUrl) })
                completionHandler(appDisplayModels, nil)
            case .Fail(let error):
                completionHandler(nil, error)
            }
        }
    }
    
}
