//
//  RootAssembly.swift
//  SOADemo
//
//  Created by Alex Zverev on 16.04.17.
//  Copyright © 2017 a.y.zverev. All rights reserved.
//

import Foundation

class RootAssembly {
    lazy var presentationAssembly: PresentationAssembly = PresentationAssembly(serviceAssembly: self.serviceAssembly)
    private lazy var serviceAssembly = ServicesAssembly(coreAssembly: self.coreAssembly)
    private lazy var coreAssembly = CoreAssembly()
}
