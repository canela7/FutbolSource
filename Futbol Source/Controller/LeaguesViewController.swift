//
//  LeaguesViewController.swift
//  Futbol Source
//
//  Created by Brian Canela on 6/3/19.
//  Copyright © 2019 Brian Canela. All rights reserved.
//

import UIKit

private let reuseIdentifier = "leaguesCell"

class LeaguesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let data = DataSet()
    
    let leagueAPI = LeaguesAPI()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.layer.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        navigationItem.title = "Leagues";
        // Do any additional setup after loading the view.
        getLeagues()
    }
    
    
    func getLeagues() {
        
            self.showSpinner()
        
            leagueAPI.getLeaguesAlamoFire { (leagues) in
                
               if self.leagueAPI.leagues.count > 0 {
                
                    self.removeSpinner()
                
                    self.tableView.reloadData()
                    if let leagues = leagues {
                        leagues.forEach({ (league) in
                            print("League ID: ", league.leagueID)
                            print("League Name: ", league.leagueTitle)
                            print("League Image Link: ", league.leagueLogo)
                        })
                    }
                    
                }
            }
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTeamsSegue" {
            if let teamsDestination = segue.destination as? TeamsCollectionVC {
                if let index = tableView.indexPathForSelectedRow {
                   let teams = leagueAPI.leagues[index.row]
                   
                    teamsDestination.teamIndex = teams.leagueID
                }
            }
        }
    }


}


extension LeaguesViewController: UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagueAPI.leagues.count
        //return data.leagueCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as! LeaguesTableViewCell
     
        cell.setup(leagueModel: leagueAPI.leagues[indexPath.row])
        //cell.setup(leagueModel: data.leagueCategories[indexPath.row])
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toTeamsSegue", sender: self)
    }
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        toggleBlur(true)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        toggleBlur(false)
    }
    
    
}
