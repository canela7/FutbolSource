//
//  API_Endpoints.swift
//  Futbol Source
//
//  Created by Brian Canela on 5/31/19.
//  Copyright © 2019 Brian Canela. All rights reserved.
//

import Foundation
import UIKit
import Alamofire


let LEGAUES_URL_ENDPOINT = "https://api-football-v1.p.rapidapi.com/v2/leagues"
let LEAGUE_URL = LEGAUES_URL_ENDPOINT + "/league/"

let API_KEY = "ca2e146046msh8dc312516e7956ep17b4aejsndee61613b763"
let X_RapidAPI_Host = "api-football-v1.p.rapidapi.com"

let HEADERS: HTTPHeaders = [
    "X-RapidAPI-Host": X_RapidAPI_Host,
    "X-RapidAPI-Key": API_KEY,
]


typealias LeaguesResponseCompletion = (Leagues?) -> Void

