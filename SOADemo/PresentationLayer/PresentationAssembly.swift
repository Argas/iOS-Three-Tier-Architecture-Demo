//
//  DemoAssembly.swift
//  SOADemo
//
//  Created by a.y.zverev on 14.04.17.
//  Copyright © 2017 a.y.zverev. All rights reserved.
//

import Foundation
import UIKit

class PresentationAssembly {
    
    private let serviceAssembly: ServicesAssembly
    
    init(serviceAssembly: ServicesAssembly) {
        self.serviceAssembly = serviceAssembly
    }
    
    // MARK: - DemoViewController
    
    func demoViewCotnroller() -> DemoViewController {
        let model = demoModel()
        let demoVC = DemoViewController(model: model)
        model.delegate = demoVC
        return demoVC
    }
    
    private func demoModel() -> IDemoModel {
        return DemoModel(appsService: serviceAssembly.appService,
                         tracksService: serviceAssembly.tracksService)
    }
    
    // MARK: - AnotherViewController
    //.....
}
