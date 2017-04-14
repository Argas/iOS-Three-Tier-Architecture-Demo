//
//  RequestsFactory.swift
//  SOADemo
//
//  Created by a.y.zverev on 14.04.17.
//  Copyright © 2017 a.y.zverev. All rights reserved.
//

import Foundation

struct RequestsFactory {
    
    struct AppleRSSRequests {
        static let newAppsConfig = RequestConfig<[AppApiModel]>(request:NewAppsRequest(), parser: AppsParser())
        static let topPaidAppsConfig = RequestConfig<[AppApiModel]>(request:TopPaidAppsRequest(), parser: AppsParser())
        static let topFreeAppsConfig = RequestConfig<[AppApiModel]>(request:TopFreeAppsRequest(), parser: AppsParser())
    }
    
}
