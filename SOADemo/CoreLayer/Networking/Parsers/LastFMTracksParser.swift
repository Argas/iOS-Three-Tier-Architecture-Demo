//
//  LastFMTracksParser.swift
//  SOADemo
//
//  Created by Alex Zverev on 15.04.17.
//  Copyright © 2017 a.y.zverev. All rights reserved.
//

import Foundation
import SwiftyJSON

struct TrackApiModel {
    let artist: String
    let name: String
    let coverUrl: String
}

class LastFMTracksParser: Parser<[TrackApiModel]> {
    override func parse(data: Data) -> [TrackApiModel]? {
        let json = JSON(data: data)
        guard let tracks = json["tracks"]["track"].array else {
            return nil
        }
        
        var trackModelds: [TrackApiModel] = []
        for track in tracks {
            guard let name = track["name"].string,
                let artist =  track["artist"]["name"].string,
                let coverUrl = track["image"].array?.first?["#text"].string else {
                    continue
                    
            }
            trackModelds.append(TrackApiModel(artist: artist,
                                              name: name,
                                              coverUrl: coverUrl))
            
        }
    
        return trackModelds
    }
}
