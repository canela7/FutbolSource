//
//  LeaguesCollectionVC.swift
//  Futbol Source
//
//  Created by Brian Canela on 5/31/19.
//  Copyright © 2019 Brian Canela. All rights reserved.
//
//
import UIKit

private let reuseIdentifier = "teamsCell"

class TeamsCollectionVC: UIViewController {
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var teamsView: UIViewController!
    @IBOutlet weak var standingsView: UIViewController!
    
    let leagueData = LeaguesAPI()
    
    //let data = DataSet()
    
    
    let teamsAPI = TeamsAPI()
    let leagues = TeamsCollectionViewCell()
    let teamsIDLeague = [2,4]
    
    //need to get the data from the leaguesviewcontroller
    var teamIndex: Int?
    
    var teamIdToPass: Teams?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.layer.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
       
        navigationItem.title = "Teams";
        
        ///step 1: make network request,, then get the leagues from completion handler in Leaguesapi file
    
        if let leagueID = teamIndex {
            //SINCE IT IS NOT STATIC WE GET AN EMPTY ARRAY WHICH WE NEED SINCE WE ONLY WANT THE ID!!!
            getTeamsName(leagueID: leagueID)
        }
        
    }
    
    
    
    
    func getTeamsName(leagueID: Int) {
        
            self.showSpinner()
        
            teamsAPI.getTeamAlamoFire(id: leagueID) { (teams) in
                
                if self.teamsAPI.teams.count > 0 {
                    self.removeSpinner()
                    
                    self.collectionView.reloadData()
                    
                    if let teams = teams {
                        teams.forEach({ (team) in
                          //  print("Team Name:", team.title)
                          //  print("Team Image Logo Data:", team.imageName)
                        })
                    }
                }
            }
    }
    
    
    
    @IBAction func clickedStandings(_ sender: Any) {
        
        
        let storyboard = UIStoryboard(name: String(describing: StandingsViewController.self), bundle: nil)
        let standingsvc = storyboard.instantiateInitialViewController()!
        let vc = standingsvc as! StandingsViewController
        
        
        //pass teamIndex to the standings vc
        vc.leagueIndex = teamIndex
            
        self.present(vc, animated: true, completion: nil)
    }
    
}

extension TeamsCollectionVC: UICollectionViewDelegate, UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return data.categories.count;
        return teamsAPI.teams.count;
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? TeamsCollectionViewCell {
            cell.configureCell(league: teamsAPI.teams[indexPath.row])
            return cell
        }

        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = view.bounds.width
        let cellDimension = (width / 2) - 15 //15 is the spacing between the collection view cells
        return CGSize(width: cellDimension, height: cellDimension)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        //pass the team id to the players view controller. need to fix this part
        teamIdToPass = teamsAPI.teams[indexPath.item]

        print("Inside teams collection view, ", teamIdToPass ?? "NothingInsideTeamCollectionView")
        performSegue(withIdentifier: "goToPlayers", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let playersVC = segue.destination as? PlayersViewController {
            playersVC.teamId = teamIdToPass
        }
    }
    
    
}
