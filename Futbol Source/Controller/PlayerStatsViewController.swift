//
//  PlayerStatsViewController.swift
//  Futbol Source
//
//  Created by Brian Canela on 6/17/19.
//  Copyright © 2019 Brian Canela. All rights reserved.
//

import UIKit

class PlayerStatsViewController: UIViewController {

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
    
    
    let playerStatsAPI = PlayerStatsAPI()
    
    var playerID: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Inside Player Stats: ", playerID ?? "None")
        
    }
    
    
    func getPlayerStats(playerID: Int) {
        self.showSpinner()
        playerStatsAPI.getPlayerStatsAlamoFire(id: playerID, completion: { (playerStat) in
            if self.playerStatsAPI.playerStats.count > 0 {
                self.removeSpinner()
            }
        })
    }
    



}
