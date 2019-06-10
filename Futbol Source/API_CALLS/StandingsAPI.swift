//
//  StandingsAPI.swift
//  Futbol Source
//
//  Created by Brian Canela on 6/8/19.
//  Copyright © 2019 Brian Canela. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON



class StandingsAPI {
    
    var standings = [Standings]()
    
    
    func getLeagueStandingsAlamoFire(id: Int, completion: @escaping StandingsResponseCompletion) {
        
        guard let url = URL(string: "\(STANDINGS_URL)\(id)") else {
            print("Error getting LEAGUE_URL. FILE: LEAGUE_API")
            return
        }
        
        print("URL: ",  url)
        
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
                let standing = self.parseStandingsSwifty(json: json)
                
                DispatchQueue.global(qos: .userInteractive).async {
                    DispatchQueue.main.async {
                        
                        completion(standing)
                    }
                }
                
            }catch{
                debugPrint(error.localizedDescription)
            }
        }
        
    }
    
    
    private func parseStandingsSwifty(json: JSON) -> [Standings] {
        let standingsArray = json["api"]["standings"].arrayValue
        let teamStandingArray = standingsArray[0].arrayValue
        
        for team in teamStandingArray{
                print(team["rank"].stringValue)
                print(team["teamName"].stringValue)
                print(team["points"].intValue)
                print(team["logo"].stringValue)
            
            let teamRank = team["rank"].intValue
            let teamName = team["teamName"].stringValue
            let teamPoints = team["points"].intValue
            let teamLogo = team["logo"].stringValue
            let leagueName = team["group"].stringValue
            
            let teamStandings = Standings(rank: teamRank, teamName: teamName, teamPoints: teamPoints, leagueLogo: teamLogo, leagueName: leagueName)
            
            standings.append(teamStandings)
        }
       return standings
    }
    
    
}
