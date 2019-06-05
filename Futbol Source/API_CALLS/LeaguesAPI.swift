//
//  LeaguesAPI.swift
//  Futbol Source
//
//  Created by Brian Canela on 6/4/19.
//  Copyright © 2019 Brian Canela. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class LeaguesAPI {
    
    var leagues = [Leagues]()
    let leaguesID = [2,8,28,30,31,199]
    
    func getLeaguesAlamoFire(completion: @escaping LeaguesResponseCompletion) {
        
        guard let url = URL(string: "\(LEGAUES_URL_ENDPOINT)") else {
            print("Error getting LEAGUE_URL. FILE: LEAGUE_API")
            return
        }
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: HEADERS).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint("FILE ERROR IN: LeaguesAPI: ", error.localizedDescription)
                completion(nil)
                return
            }
            guard let data = response.data else {return completion(nil)}
            
            do{
                
                let json = try JSON(data: data)
                let league =  self.parseLeagueSwifty(json: json)
                
                
                DispatchQueue.global(qos: .userInitiated).async {
                    DispatchQueue.main.async {
                        completion(league)
                    }
                }
            }catch{
                debugPrint("Error in LeaguesAPI: ", error.localizedDescription)
            }
        }
    }
    
    
    private func parseLeagueSwifty(json: JSON) -> [Leagues] {
        
        for leaguesName in json["api"]["leagues"].arrayValue {
            let leagueID = leaguesName["league_id"].intValue
            let leagueName = leaguesName["name"].stringValue
            let leagueImageLogo = leaguesName["logo"].stringValue
          
            if leaguesID.contains(leagueID) {
                
                let league = Leagues(leagueID: leagueID, leagueTitle: leagueName, leagueLogo: leagueImageLogo)
                   leagues.append(league)
                
            }
            
        }
        print("Leagues:", leagues)
        print("Leagues Number:", leagues.count)
        return leagues
    }
}
