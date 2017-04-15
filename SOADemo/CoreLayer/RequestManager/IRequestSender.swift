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

enum Result<T> {
    case Success(T)
    case Fail(String)
}

protocol IRequestSender {
    func send<T>(config: RequestConfig<T>, completionHandler: @escaping (Result<T>) -> Void)
}

