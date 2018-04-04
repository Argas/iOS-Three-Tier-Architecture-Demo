//
//  File.swift
//  SOADemo
//
//  Created by a.y.zverev on 14.04.17.
//  Copyright © 2017 a.y.zverev. All rights reserved.
//

import Foundation

protocol IAppsService {
    func loadNewApps(completionHandler: @escaping ([AppApiModel]?, String?) -> Void)
    func loadTopFreeApps(completionHandler: @escaping ([AppApiModel]?, String?) -> Void)
    func loadTopPaidApps(completionHandler: @escaping ([AppApiModel]?, String?) -> Void)
}

class AppsService: IAppsService {
    
    let requestSender: IRequestSender

    init(requestSender: IRequestSender) {
        self.requestSender = requestSender
    }
    
    func loadNewApps(completionHandler: @escaping ([AppApiModel]?, String?) -> Void) {
        
        let requestConfig = RequestsFactory.AppleRSSRequests.newAppsConfig()
        
        loadApps(requestConfig: requestConfig, completionHandler: completionHandler)
    }
    
    func loadTopFreeApps(completionHandler: @escaping ([AppApiModel]?, String?) -> Void) {
        
        let requestConfig = RequestsFactory.AppleRSSRequests.topFreeAppsConfig()
        
        loadApps(requestConfig: requestConfig, completionHandler: completionHandler)
    }
    
    func loadTopPaidApps(completionHandler: @escaping ([AppApiModel]?, String?) -> Void) {
        
        let requestConfig = RequestsFactory.AppleRSSRequests.newAppsConfig()
        
        loadApps(requestConfig: requestConfig, completionHandler: completionHandler)
    }
    
    private func loadApps(requestConfig: RequestConfig<AppsParser>,
                          completionHandler: @escaping ([AppApiModel]?, String?) -> Void) {
        requestSender.send(requestConfig: requestConfig) { (result: Result<[AppApiModel]>) in
            
            switch result {
            case .success(let apps):
                completionHandler(apps, nil)
            case .error(let error):
                completionHandler(nil, error)
            }
        }
    }
    
}
