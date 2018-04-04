//
//  AppleRSSRequest.swift
//  SOADemo
//
//  Created by a.y.zverev on 14.04.17.
//  Copyright © 2017 a.y.zverev. All rights reserved.
//

import Foundation

class AppleRSSRequest: IRequest {
    fileprivate var command: String {
        assertionFailure("❌ Should use a subclass of AppleRSSRequest ")
        return ""
    }
    private var limitString: String {
        return "limit=\(limit)/"
    }
    private var baseUrl: String = "https://itunes.apple.com/us/rss/"
    private var limit: Int
    private var requestFormat: String = "json"
    
    // MARK: - IRequest

    var urlRequest: URLRequest? {
        let urlString: String = baseUrl + command + limitString + requestFormat
        if let url = URL(string: urlString) {
            return URLRequest(url: url)
        }
        
        return nil
    }
    
    // MARK: - Initialization

    init(limit: Int = 20) {
        self.limit = limit
    }
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
