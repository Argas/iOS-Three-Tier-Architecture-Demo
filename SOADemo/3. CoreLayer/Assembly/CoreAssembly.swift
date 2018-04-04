//
//  CoreAssembly.swift
//  SOADemo
//
//  Created by a.y.zverev on 04.04.2018.
//  Copyright © 2018 a.y.zverev. All rights reserved.
//

import Foundation

protocol ICoreAssembly {
    var requestSender: IRequestSender { get }
}

class CoreAssembly: ICoreAssembly {
    lazy var requestSender: IRequestSender = RequestSender()
}
