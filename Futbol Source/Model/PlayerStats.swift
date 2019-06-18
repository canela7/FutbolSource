//
//  PlayerStats.swift
//  Futbol Source
//
//  Created by Brian Canela on 6/17/19.
//  Copyright © 2019 Brian Canela. All rights reserved.
//

import Foundation

struct PlayerStats{
    
    let player_id: Int
    let player_name: String
    let player_appearances: Int
    let player_minutes: Int
    
    //need these two to get the accuracy success/attempts
    let player_dribbles_attempts: Int
    let player_dribbles_success: Int
   
    let player_passes_accuracy:Int
    let player_tackles: Int
    let player_goals: Int
    let player_assists: Int
    let player_red_cards: Int
    let player_yellow_cards: Int
    let player_conceded_goals: Int
    let player_overall_rating: Int
    
    
}
