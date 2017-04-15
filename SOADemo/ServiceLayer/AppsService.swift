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
        
        let requestConfig: RequestConfig<[AppApiModel]> = RequestsFactory.AppleRSSRequests.newAppsConfig()
        
        loadApps(requestConfig: requestConfig, completionHandler: completionHandler)
    }
    
    func loadTopFreeApps(completionHandler: @escaping ([AppApiModel]?, String?) -> Void) {
        
        let requestConfig: RequestConfig<[AppApiModel]> = RequestsFactory.AppleRSSRequests.topFreeAppsConfig()
        
        loadApps(requestConfig: requestConfig, completionHandler: completionHandler)
    }
    
    func loadTopPaidApps(completionHandler: @escaping ([AppApiModel]?, String?) -> Void) {
        
        let requestConfig: RequestConfig<[AppApiModel]> = RequestsFactory.AppleRSSRequests.newAppsConfig()
        
        loadApps(requestConfig: requestConfig, completionHandler: completionHandler)
    }
    
    private func loadApps(requestConfig: RequestConfig<[AppApiModel]>,
                          completionHandler: @escaping ([AppApiModel]?, String?) -> Void) {
        requestSender.send(config: requestConfig) { (result: Result<[AppApiModel]>) in
            
            switch result {
            case .Success(let apps):
                completionHandler(apps, nil)
            case .Fail(let error):
                completionHandler(nil, error)
            }
        }
    }
    
}
