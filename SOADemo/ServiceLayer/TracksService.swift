//
//  TracksService.swift
//  SOADemo
//
//  Created by Alex Zverev on 15.04.17.
//  Copyright © 2017 a.y.zverev. All rights reserved.
//

import Foundation

protocol ITracksService {
    func loadTopTracks(completionHandler: @escaping ([TrackApiModel]?, String?) -> Void)
}

class TracksService: ITracksService {
    
    let requestSender: IRequestSender
    
    init(requestSender: IRequestSender) {
        self.requestSender = requestSender
    }
    
    func loadTopTracks(completionHandler: @escaping ([TrackApiModel]?, String?) -> Void) {
        let requestConfig = RequestsFactory.LastFMRequests.topTracksConfig()
        
        requestSender.send(requestConfig: requestConfig) { (result: Result<[TrackApiModel]>) in
            switch result {
            case .success(let tracks):
                completionHandler(tracks, nil)
            case .error(let error):
                completionHandler(nil, error)
            }
        }
        
    }
}
