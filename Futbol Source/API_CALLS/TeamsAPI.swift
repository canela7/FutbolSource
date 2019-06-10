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

class TeamsAPI {
    
    var teams = [Teams]()
    
    func getTeamAlamoFire(id: Int, completion: @escaping TeamsResponseCompletion) {
        
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
                let team = self.parseTeamsSwifty(json: json)
                
                DispatchQueue.global(qos: .userInteractive).async {
                    DispatchQueue.main.async {
                        
                        completion(team)
                    }
                }
                
            }catch{
                debugPrint(error.localizedDescription)
            }
        }
        
    }
    
    
    //parsing with Swifty Json
    private func parseTeamsSwifty(json: JSON) -> [Teams] {
        //our api input is dictionary of key type string and value of any
      
        for teamName in json["api"]["teams"].arrayValue {
            let leagueTeamName = teamName["name"].stringValue
            let leagueImageData = teamName["logo"].stringValue
            let team = Teams(title: leagueTeamName, imageName: leagueImageData)
            teams.append(team)
        }
        return teams
    }
    
}
