//
//  PlayerStatsAPI.swift
//  Futbol Source
//
//  Created by Brian Canela on 6/17/19.
//  Copyright © 2019 Brian Canela. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PlayerStatsAPI {
    
     var playerStats = [PlayerStats]()
    
    func getPlayerStatsAlamoFire(id: Int, completion: @escaping PlayerStatsResponseCompletion) {
        
        guard let url = URL(string: "\(PLAYER_STATS_URL)\(id)") else {
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
                let players_stats_json = self.parsePlayerStatsSwifty(json: json)
                
                DispatchQueue.global(qos: .userInteractive).async {
                    DispatchQueue.main.async {
                        
                        completion(players_stats_json)
                    }
                }
                
            }catch{
                debugPrint(error.localizedDescription)
            }
        }
        
    }

    
    
    private func parsePlayerStatsSwifty(json: JSON) -> [PlayerStats] {
        //our api input is dictionary of key type string and value of any
        let playerStatsArray = json["api"]["players"].arrayValue
    
        for player in playerStatsArray {
            
            print("PlayerID: ", player[0]["player_id"].intValue)
            print("Player Name:", player[0]["player_name"].stringValue)
            print("Player Appearences:", player[0]["games"]["appearences"].intValue)
            print("Player Minutes Played:", player[0]["games"]["minutes_played"].intValue)
            
            print("Player Dribbles Attempts: ", player[0]["dribbles"]["attempts"].intValue)
            print("Player Dribbles Success:", player[0]["dribbles"]["success"].intValue)
            
            print("Player Passes Accuracy:", player[0]["passes"]["accuracy"].intValue)
            print("Player total Tackles: ", player[0]["tackles"]["total"].intValue)
            
            print("Player total goals: ", player[0]["goals"]["total"].intValue)
            
            print("Player Assists: ", player[0]["goals"]["assists"].intValue)
            
            print("Player red card: ", player[0]["cards"]["red"].intValue)
            print("Player yellow card: ", player[0]["cards"]["yellow"].intValue)
            
            
            print("Player goal conced:", player[0]["goals"]["conceded"].intValue)
            
            print("Player rating:", player[0]["rating"].intValue)
  
            
            let playerId = player[0]["player_id"].intValue
            let playerName = player[0]["player_name"].stringValue
            let playerApp = player[0]["games"]["appearences"].intValue
            let playerMinutes = player[0]["games"]["minutes_played"].intValue
            let playerDribbleAttempts = player[0]["dribbles"]["attempts"].intValue
            let playerDribbleSuccess = player[0]["dribbles"]["success"].intValue
            let playerPassesAccuracy = player[0]["passes"]["accuracy"].intValue
            let playerTotalTackles  = player[0]["tackles"]["total"].intValue
            let playerTotalGoals = player[0]["goals"]["total"].intValue
            let playerAssists = player[0]["goals"]["assists"].intValue
            let playerRedCards =  player[0]["cards"]["red"].intValue
            let playerYellowCards = player[0]["cards"]["yellow"].intValue
            let playerGoalConceded = player[0]["goals"]["conceded"].intValue
            let playerRating = player[0]["rating"].intValue
            
            let playerStatistics = PlayerStats(player_id: playerId, player_name: playerName, player_appearances: playerApp, player_minutes: playerMinutes, player_dribbles_attempts: playerDribbleAttempts, player_dribbles_success: playerDribbleSuccess, player_passes_accuracy: playerPassesAccuracy, player_tackles: playerTotalTackles, player_goals: playerTotalGoals, player_assists: playerAssists, player_red_cards: playerRedCards, player_yellow_cards: playerYellowCards, player_conceded_goals: playerGoalConceded, player_overall_rating: playerRating)
            
            playerStats.append(playerStatistics)
        }
        
        
        return playerStats
    }
    
}
