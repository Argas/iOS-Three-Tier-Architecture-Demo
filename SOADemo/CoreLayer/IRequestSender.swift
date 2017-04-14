//
//  IRequestSender.swift
//  SOADemo
//
//  Created by a.y.zverev on 13.04.17.
//  Copyright © 2017 a.y.zverev. All rights reserved.
//

import Foundation




struct RequestConfig<T> {
    let request: IRequest
    let parser: Parser<T>
}

protocol IResult {
    
}

protocol IRequestSender {
    func send<T>(config: RequestConfig<T>, completionHandler: @escaping (T?) -> Void)
}

class RequestSender: IRequestSender {
    
    let session = URLSession.shared
    
    func send<T>(config: RequestConfig<T>, completionHandler: @escaping (T?) -> Void) {
        
        print("=== Request URL: \(config.request.urlString)")
        
        guard let url = URL(string: config.request.urlString) else {
            completionHandler(nil)
            return
        }
        
        var urlRequest = URLRequest(url: url)
        
        if let postParametrsStrings = config.request.postParametrsString {
            urlRequest.httpMethod = "POST"
            urlRequest.httpBody = postParametrsStrings.data(using: .utf8)
        }
        
        let task = session.dataTask(with: urlRequest) { (data: Data?, response: URLResponse?, error: Error?) in
            if let data = data {
                let parsedModel: T? = config.parser.parse(data: data)
                completionHandler(parsedModel)
            }
        }
        
        task.resume()
    }
}
