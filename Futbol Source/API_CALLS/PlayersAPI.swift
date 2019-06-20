//
//  PlayersAPI.swift
//  Futbol Source
//
//  Created by Brian Canela on 6/13/19.
//  Copyright © 2019 Brian Canela. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON


class PlayersAPI {
    
    var players = [Players]()
    
    
    func getTeamPlayersAlamoFire(id: Int, completion: @escaping PlayersResponseCompletion) {
        
        guard let url = URL(string: "\(PLAYERS_URL)\(id)") else {
            print("Error getting LEAGUE_URL. FILE: LEAGUE_API")
            return
        }
        
      //  print("URL: ",  url)
        
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
                let players_json = self.parsePlayersSwifty(json: json)
                
                DispatchQueue.global(qos: .userInteractive).async {
                    DispatchQueue.main.async {
                        
                        completion(players_json)
                    }
                }
                
            }catch{
                debugPrint(error.localizedDescription)
            }
        }
        
    }
    
    
    private func parsePlayersSwifty(json: JSON) -> [Players] {
        //our api input is dictionary of key type string and value of any
        
        for player in json["api"]["players"].arrayValue {
           
//            print(player["player_id"].intValue)
//            print(player["player_name"].stringValue)
//            print(player["position"].stringValue)
//            print(player["age"].intValue)
            
            let playerID = player["player_id"].intValue
            let playerName = player["player_name"].stringValue
            let playerPosition = player["position"].stringValue
            let playerAge = player["age"].intValue
            let player = Players(playerID: playerID, playerPosition: playerPosition, playerName: playerName, playerAge: playerAge)
            
            players.append(player)
        }
        
    
        return players
    }
    
}
