//
//  LastFMTracksRequest.swift
//  SOADemo
//
//  Created by Alex Zverev on 15.04.17.
//  Copyright © 2017 a.y.zverev. All rights reserved.
//

import Foundation

// https//ws.audioscrobbler.com/2.0/?method=chart.gettoptracks&api_key=d2fc8ba489c03df1a0f1eba71dea6fd9&format=json

class LastFMTopTracksRequest: IRequest {
    private var baseUrl: String =  "https://ws.audioscrobbler.com/"
    private var apiVersion: String = "2.0/"
    private var command: String = "chart.gettoptracks"
    private let apiKey: String
    private var getParameters: [String : String]  {
        return ["method" : command,
                "api_key": apiKey,
                "format" : "json"]
    }
    private var urlString: String {
        let getParams = getParameters.flatMap({ "\($0.key)=\($0.value)"}).joined(separator: "&")
        return baseUrl + apiVersion + "?" + getParams
    }
    
    // MARK: - IRequest
    
    var urlRequest: URLRequest? {
        if let url = URL(string: urlString) {
            return URLRequest(url: url)
        }
        return nil
    }
    
    // MARK: - Initialization

    init(apiKey: String) {
        self.apiKey = apiKey
    }    
}
