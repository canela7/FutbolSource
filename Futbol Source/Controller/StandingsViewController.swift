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
        }
        
    }
 
   
    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
