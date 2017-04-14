//
//  DemoModel.swift
//  SOADemo
//
//  Created by a.y.zverev on 12.04.17.
//  Copyright © 2017 a.y.zverev. All rights reserved.
//

import UIKit
import Foundation

struct AppDisplayModel {
    let title: String
    let imageUrl: String
}

protocol IDemoModel {
    func fetchNewApps(completionHandler: @escaping ([AppDisplayModel]?, String?) -> Void)
}

class DemoModel: IDemoModel {
    let appsService:  IAppsService
    
    init(appsService: IAppsService) {
        self.appsService = appsService
    }
    
    func fetchNewApps(completionHandler: @escaping ([AppDisplayModel]?, String?) -> Void) {
        //
    }

}
