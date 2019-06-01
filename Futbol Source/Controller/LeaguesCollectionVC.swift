//
//  LeaguesCollectionVC.swift
//  Futbol Source
//
//  Created by Brian Canela on 5/31/19.
//  Copyright © 2019 Brian Canela. All rights reserved.
//

import UIKit

private let reuseIdentifier = "leaguesCell"

class LeaguesCollectionVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let data = DataSet()
    
    var leagueAPI = LeagueAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.layer.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        
        ///step 1: make network request,, then get the leagues from completion handler in Leaguesapi file
        
        getRandomLeagues()
       
    }
    
    func getRandomLeagues() {
        for id in 2..<3 {
            leagueAPI.getLeagueURLSession(id: id) { (leagues) in
                if let leagues = leagues {
                    print(leagues.title)
                    print(leagues.imageName)
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.categories.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? LeaguesCollectionViewCell {
            cell.configureCell(league: data.categories[indexPath.row])
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.bounds.width
        let cellDimension = (width / 2) - 15 //15 is the spacing between the collection view cells
        print(width, cellDimension)
        return CGSize(width: cellDimension, height: cellDimension)
    }
    

}
