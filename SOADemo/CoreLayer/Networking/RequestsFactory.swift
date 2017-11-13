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
        
        static func newAppsConfig() -> RequestConfig<AppsParser> {
            return RequestConfig<AppsParser>(request:NewAppsRequest(), parser: AppsParser())
        }
        
        static func topPaidAppsConfig() -> RequestConfig<AppsParser> {
            return RequestConfig<AppsParser>(request:TopPaidAppsRequest(), parser: AppsParser())
        }
        
        static func topFreeAppsConfig() -> RequestConfig<AppsParser> {
            return RequestConfig<AppsParser>(request:TopFreeAppsRequest(), parser: AppsParser())
        }
    }
    
    struct LastFMRequests {
        static func topTracksConfig() -> RequestConfig<LastFMTracksParser> {
            let request = LastFMTopTracksRequest(apiKey: "d2fc8ba489c03df1a0f1eba71dea6fd9")
            return RequestConfig<LastFMTracksParser>(request:request, parser: LastFMTracksParser())
        }
    }
    
}
