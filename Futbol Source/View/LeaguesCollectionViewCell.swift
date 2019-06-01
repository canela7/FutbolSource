//
//  LeaguesCollectionViewCell.swift
//  Futbol Source
//
//  Created by Brian Canela on 5/31/19.
//  Copyright © 2019 Brian Canela. All rights reserved.
//

import UIKit

class LeaguesCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var leagueImage: UIImageView!
    
    @IBOutlet weak var leagueNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        leagueImage.layer.cornerRadius =  CGFloat(roundf(Float(self.leagueImage.frame.size.width / 2.0)))
        leagueNameLabel.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        
    }
    
    
    func configureCell(league: Leagues){
        leagueImage.image = UIImage(named: league.imageName)
        leagueNameLabel.text = league.title
    }
    
}
