//
//  LeagueAPI.swift
//  Futbol Source
//
//  Created by Brian Canela on 5/31/19.
//  Copyright © 2019 Brian Canela. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class LeagueAPI {
    
    var teams = [Leagues]()
    
    func getLeagueAlamoFire(id: Int, completion: @escaping LeaguesResponseCompletion) {
        
        guard let url = URL(string: "\(TEAMS_LEAGUE_URL)\(id)") else {
            print("Error getting LEAGUE_URL. FILE: LEAGUE_API")
            return
        }
        
        let parameters: Parameters = ["id": id.description]
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: HEADERS).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = response.data else { return completion(nil)}
     
            do {
                let json = try JSON(data: data)
               // print("Completed: ", json)
                let person = self.parseLeaguesSwifty(json: json)
                completion(person)
            }catch{
                debugPrint(error.localizedDescription)
            }
        }
        
    }
    
    
    //parsing with Swifty Json
    private func parseLeaguesSwifty(json: JSON) -> [Leagues] {
        //our api input is dictionary of key type string and value of any
        
        for teamName in json["api"]["teams"].arrayValue {
            
//            teamNames.append(teamName["name"].stringValue)
            
            let leagueTeamName = teamName["name"].stringValue
            
            let team = Leagues(title: leagueTeamName, imageName: "burger0")
            
            teams.append(team)
        }
                
        //let team = Leagues(title: "N/A", imageName: "burger0")
        
        return teams
    }
    
}
