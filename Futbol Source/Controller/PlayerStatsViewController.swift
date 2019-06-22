//
//  PlayerStatsViewController.swift
//  Futbol Source
//
//  Created by Brian Canela on 6/17/19.
//  Copyright © 2019 Brian Canela. All rights reserved.
//

import UIKit

class PlayerStatsViewController: UIViewController {

    @IBOutlet weak var playerStatsCardView: UIView!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var appearanceLabel: UILabel!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var dribblingLabel: UILabel!
    @IBOutlet weak var tacklesLabel: UILabel!
    @IBOutlet weak var goalsLabel: UILabel!
    @IBOutlet weak var assistsLabel: UILabel!
    @IBOutlet weak var redCardLabel: UILabel!
    @IBOutlet weak var yellowCardLabel: UILabel!
    @IBOutlet weak var concededGoalsLabel: UILabel!
    @IBOutlet weak var playerRatingLabel: UILabel!
    
    
    let playerStatsAPI = PlayerStatsAPI()
    
    var playerID: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerStatsCardView.addShadowAndRoundedCornerForPlayerStatView()
        
        print("Inside Player Stats: ", playerID ?? "None")
        
        if let player_id = playerID {
            getPlayerStats(playerID: player_id)
        }
        
    }
    
    
    func getPlayerStats(playerID: Int) {
        self.showSpinner()
        playerStatsAPI.getPlayerStatsAlamoFire(id: playerID, completion: { (playerStat) in
            if self.playerStatsAPI.playerStats.count > 0 {
                
                if let playerStat = playerStat {
                    print("PLAYER STATS: ", playerStat[0])
                    self.playerNameLabel.text = playerStat[0].player_name
                    self.appearanceLabel.text = "\(playerStat[0].player_appearances)"
                    self.minutesLabel.text = "\(playerStat[0].player_minutes)"
                    
                    if(playerStat[0].player_dribbles_attempts == 0){
                        self.dribblingLabel.text = "\(0)"
                    }else{
                        self.dribblingLabel.text = "\((playerStat[0].player_dribbles_success)/(playerStat[0].player_dribbles_attempts))"
                    }
                    
                    self.tacklesLabel.text = "\(playerStat[0].player_tackles)"
                    self.goalsLabel.text = "\(playerStat[0].player_goals)"
                    self.assistsLabel.text = "\(playerStat[0].player_assists)"
                    self.redCardLabel.text = "\(playerStat[0].player_red_cards)"
                    self.yellowCardLabel.text = "\(playerStat[0].player_yellow_cards)"
                    self.concededGoalsLabel.text = "\(playerStat[0].player_conceded_goals)"
                    self.playerRatingLabel.text = "\(playerStat[0].player_overall_rating)"
                }
                
                self.removeSpinner()
            }
        })
    }
    



}
