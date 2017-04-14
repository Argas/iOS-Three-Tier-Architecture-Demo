//
//  AppleRSSRequest.swift
//  SOADemo
//
//  Created by a.y.zverev on 14.04.17.
//  Copyright © 2017 a.y.zverev. All rights reserved.
//

import Foundation

class AppleRSSRequest: IRequest {
    var command: String {
        assertionFailure("❌ Should use a subclass of AppleRSSAPI ")
        return ""
    }
    var baseUrl: String = "https://itunes.apple.com/us/rss/"
    var limit: String? = "limit=20/"
    var requestFormat: String? = "json"
    var getParametrs: [String : Any]? = nil
    var postParametrsString: String? = nil
}

class NewAppsRequest: AppleRSSRequest {
    override var command: String { return "topfreeebooks/" }
}

class TopPaidAppsRequest: AppleRSSRequest {
    override var command: String { return "toppaidapplications/" }
}

class TopFreeAppsRequest: AppleRSSRequest {
    override var command: String { return "topfreeapplications/" }
}
