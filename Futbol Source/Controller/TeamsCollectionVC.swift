//
//  LeaguesCollectionVC.swift
//  Futbol Source
//
//  Created by Brian Canela on 5/31/19.
//  Copyright © 2019 Brian Canela. All rights reserved.
//

import UIKit

private let reuseIdentifier = "leaguesCell"

class TeamsCollectionVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout {
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    let data = DataSet()
    
    let teamsAPI = TeamsAPI()
    let leagues = TeamsCollectionViewCell()
    let teamsIDLeague = [2,4]
    
    //var teamsNames = [Leagues]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.layer.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        
        navigationItem.title = "Teams";
        
        ///step 1: make network request,, then get the leagues from completion handler in Leaguesapi file
        
        getTeamsName()
        
    }
    
    func getTeamsName() {
        for id in teamsIDLeague {
            
            teamsAPI.getTeamAlamoFire(id: id) { (teams) in
                
                //self.collectionView.reloadData()
                
                if self.teamsAPI.teams.count > 0 {
                    
                    print("Teams: ", teams ?? "")
                    self.collectionView.reloadData()
                    
                    if let teams = teams {
                        teams.forEach({ (team) in
                            print("Team Name:", team.title)
                            print("Team Image Logo Data:", team.imageName)
                        })
                    }
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("INSIDE FILE: LEAGUECOLLECTIONVC: ", teamsAPI.teams.count)
        
        //return data.categories.count;
        return teamsAPI.teams.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? TeamsCollectionViewCell {
            cell.configureCell(league: teamsAPI.teams[indexPath.row])
            //cell.configureCell(league: data.categories[indexPath.row])
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.bounds.width
        let cellDimension = (width / 2) - 15 //15 is the spacing between the collection view cells
        //print(width, cellDimension)
        return CGSize(width: cellDimension, height: cellDimension)
    }
    
    
}
