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
    @IBOutlet weak var leagueName: UILabel!
    
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
                    self.leagueName.text = "\(standings[0].leagueName)"
                }
            }
        }
    }

    
}


extension StandingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return standingAPI.standings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? StandingsTableViewCell {
            //cell.configureCell(league: teamsAPI.teams[indexPath.row])
            cell.setup(standingsModel: standingAPI.standings[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
