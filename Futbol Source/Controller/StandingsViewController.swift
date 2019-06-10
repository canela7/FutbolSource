//
//  StandingsViewController.swift
//  Futbol Source
//
//  Created by Brian Canela on 6/6/19.
//  Copyright © 2019 Brian Canela. All rights reserved.
//

import UIKit

private let reuseIdentifier = "standingsCell"

class StandingsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let standingAPI = StandingsAPI()
    //need to get the data from the leaguesviewcontroller
    var leagueIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
        
        if let leagueID  = leagueIndex {
            print("Inside StandingsVC")
            print(leagueID)
            getLeagueStandings(leagueID: leagueID)
        }
        
    }
 
   
    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func getLeagueStandings(leagueID: Int) {
        
        self.showSpinner()
        
        standingAPI.getLeagueStandingsAlamoFire(id: leagueID) { (standings) in
            
            if self.standingAPI.standings.count > 0 {
                self.removeSpinner()
                
                self.tableView.reloadData()
                
                if let standings = standings {
                    standings.forEach({ (standing) in
                        print(standing.rank)
                        print(standing.teamName)
                        print(standing.teamPoints)
                        print(standing.leagueLogo)
                    })
                }
            }
        }
    }

    
}


extension StandingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? LeaguesTableViewCell {
            //cell.configureCell(league: teamsAPI.teams[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
    
    
}
