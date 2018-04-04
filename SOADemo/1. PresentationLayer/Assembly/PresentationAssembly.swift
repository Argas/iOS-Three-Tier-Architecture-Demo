//
//  DemoAssembly.swift
//  SOADemo
//
//  Created by a.y.zverev on 14.04.17.
//  Copyright © 2017 a.y.zverev. All rights reserved.
//

import Foundation
import UIKit

protocol IPresentationAssembly {
    /// Создает экран с приложениями
    func demoViewCotnroller() -> DemoViewController
    
    /// Создает экран где бегают пингвинчики
    func pinguinViewController() -> PinguinViewController
}

class PresentationAssembly: IPresentationAssembly {
    
    private let serviceAssembly: IServicesAssembly
    
    init(serviceAssembly: IServicesAssembly) {
        self.serviceAssembly = serviceAssembly
    }
    
    // MARK: - DemoViewController
    
    func demoViewCotnroller() -> DemoViewController {
        let model = demoModel()
        let demoVC = DemoViewController(model: model, presentationAssembly: self)
        model.delegate = demoVC
        return demoVC
    }
    
    private func demoModel() -> IDemoModel {
        return DemoModel(appsService: serviceAssembly.appService,
                         tracksService: serviceAssembly.tracksService)
    }
    
    // MARK: - PinguinViewController
    
    func pinguinViewController() -> PinguinViewController {
        return PinguinViewController()
    }
    
    // MARK: - AnotherViewController
    //.....
}
