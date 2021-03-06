//
//  PlayersViewController.swift
//  Futbol Source
//
//  Created by Brian Canela on 6/13/19.
//  Copyright © 2019 Brian Canela. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

private let reuseIdentifier = "playersCell"

class PlayersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let playerAPI = PlayersAPI()
    
    let playerStatsAPI = PlayerStatsAPI()
    
    var teamId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        //navigationItem.title = "Players";
        
       //print("Inside TeamId: ", teamId ?? "No value for team ID")
        
        if let teamID = teamId {
            //print("I am inside the PlayersVC: ", teamID)
            getPlayers(teamID: teamID)
        }
        
//        getPlayers(teamID: 104)

    }
    
    func getPlayers(teamID: Int) {
        
        self.showSpinner()
        
        playerAPI.getTeamPlayersAlamoFire(id: teamID) { (players) in
            if self.playerAPI.players.count > 0 {
                
                self.removeSpinner()
                self.tableView.reloadData()
                
                if let players = players {
                    players.forEach({ (player) in
//                        print("Player ID: ", player.playerID)
//                        print("Player Name: ", player.playerName)
//                        print("Player Position: ", player.playerPosition)
//                        print("Player Age: ", player.playerAge)
                    })
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToPlayerStats" {
            if let playerDestination = segue.destination as? PlayerStatsViewController {
                if let index = tableView.indexPathForSelectedRow {
                    let player = playerAPI.players[index.row]
                    playerDestination.playerID = player.playerID
                }
            }
        }
    }

}

extension PlayersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerAPI.players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as! PlayersTableViewCell
            cell.setup(player: playerAPI.players[indexPath.row])
            return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "goToPlayerStats", sender: self)
    }
    
}
