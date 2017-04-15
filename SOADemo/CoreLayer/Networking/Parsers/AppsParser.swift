//
//  AppsParser.swift
//  SOADemo
//
//  Created by a.y.zverev on 14.04.17.
//  Copyright © 2017 a.y.zverev. All rights reserved.
//

import Foundation

struct AppApiModel {
    let identifier: String
    let name: String
    let iconUrl: String
}

class AppsParser: Parser<[AppApiModel]> {
    override func parse(data: Data) -> [AppApiModel]? {
        // parse the result as JSON, since that's what the API provides
        do {
            guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject] else {
                return nil
            }
            
            guard let feed = json["feed"] as? [String : Any],
                let entry = feed["entry"] as? [[String : Any]] else {
                    return nil
            }
            
            var apps: [AppApiModel] = []
            
            for appObject in entry {
                guard let appObjectName = appObject["im:name"] as? [String : String],
                    let name = appObjectName["label"],
                    let appObjectId = appObject["id"] as? [String : Any],
                    let appObjectIdAttributes = appObjectId["attributes"] as? [String : String],
                    let identifier = appObjectIdAttributes["im:id"],
                    let appObjectImages = appObject["im:image"] as? [[String : Any]],
                    let iconUrl = appObjectImages.last?["label"] as? String
                    else { continue }
                apps.append(AppApiModel(identifier: identifier, name: name, iconUrl: iconUrl))
            }
            
            return apps
            
        } catch  {
            print("error trying to convert data to JSON")
            return nil
        }
    }
}
