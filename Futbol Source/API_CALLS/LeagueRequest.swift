//
//  LeagueRequest.swift
//  Futbol Source
//
//  Created by Brian Canela on 5/31/19.
//  Copyright © 2019 Brian Canela. All rights reserved.
//

import Alamofire

class LeagueRequest {
    
    var id: String
    
    init(id: String) {
        self.id = id
    }
    
    func getHeaders() -> HTTPHeaders {
        let xMashapeHost = "api-football-v1.p.rapidapi.com"
        let xMashapeKey = "ca2e146046msh8dc312516e7956ep17b4aejsndee61613b763"
        let headers: HTTPHeaders = [
            "X-RapidAPI-Host": xMashapeHost,
            "X-RapidAPI-Key": xMashapeKey,
        ]
        return headers
    }
    
    func toParameters() -> Parameters {
        
        let parameters: Parameters = [
            "id": self.id.description
        ]
        
        return parameters
    }
    
}

