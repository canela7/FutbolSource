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
            
            print("PlayerID: ", player["player_id"].intValue)
            print("Player Name:", player["player_name"].stringValue)
            print("Player Appearences:", player["games"]["appearences"].intValue)
            print("Player Minutes Played:", player["games"]["minutes_played"].intValue)
            
            print("Player Dribbles Attempts: ", player["dribbles"]["attempts"].intValue)
            print("Player Dribbles Success:", player["dribbles"]["success"].intValue)
            
            print("Player Passes Accuracy:", player["passes"]["accuracy"].intValue)
            print("Player total Tackles: ", player["tackles"]["total"].intValue)
            
            print("Player total goals: ", player["goals"]["total"].intValue)
            
            print("Player Assists: ", player["goals"]["assists"].intValue)
            
            print("Player red card: ", player["cards"]["red"].intValue)
            print("Player yellow card: ", player["cards"]["yellow"].intValue)
            
            
            print("Player goal conced:", player["goals"]["conceded"].intValue)
            
            print("Player rating:", player["rating"].intValue)
  
            
            let playerId = player["player_id"].intValue
            let playerName = player["player_name"].stringValue
            let playerApp = player["games"]["appearences"].intValue
            let playerMinutes = player["games"]["minutes_played"].intValue
            let playerDribbleAttempts = player["dribbles"]["attempts"].intValue
            let playerDribbleSuccess = player["dribbles"]["success"].intValue
            let playerPassesAccuracy = player["passes"]["accuracy"].intValue
            let playerTotalTackles  = player["tackles"]["total"].intValue
            let playerTotalGoals = player["goals"]["total"].intValue
            let playerAssists = player["goals"]["assists"].intValue
            let playerRedCards =  player["cards"]["red"].intValue
            let playerYellowCards = player["cards"]["yellow"].intValue
            let playerGoalConceded = player["goals"]["conceded"].intValue
            let playerRating = player["rating"].intValue
            
            let playerStatistics = PlayerStats(player_id: playerId, player_name: playerName, player_appearances: playerApp, player_minutes: playerMinutes, player_dribbles_attempts: playerDribbleAttempts, player_dribbles_success: playerDribbleSuccess, player_passes_accuracy: playerPassesAccuracy, player_tackles: playerTotalTackles, player_goals: playerTotalGoals, player_assists: playerAssists, player_red_cards: playerRedCards, player_yellow_cards: playerYellowCards, player_conceded_goals: playerGoalConceded, player_overall_rating: playerRating)
            
            playerStats.append(playerStatistics)
        }
        
        
        return playerStats
    }
    
}
