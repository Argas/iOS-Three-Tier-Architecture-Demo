//
//  IRequest.swift
//  SOADemo
//
//  Created by a.y.zverev on 14.04.17.
//  Copyright © 2017 a.y.zverev. All rights reserved.
//

import Foundation

protocol IRequest {
    var baseUrl: String { get }
    var command: String { get }
    var getParametrs: [String : Any]? { get }
    var postParametrsString: String? { get }
    var limit: String? { get }
    var requestFormat: String? { get }
    
    var urlString: String { get }
}

extension IRequest {
    var urlString: String {
        return baseUrl + command + (limit ?? "") + (requestFormat ?? "")
    }
}
