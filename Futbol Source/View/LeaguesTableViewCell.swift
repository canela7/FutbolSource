//
//  LeaguesTableViewCell.swift
//  Futbol Source
//
//  Created by Brian Canela on 6/3/19.
//  Copyright © 2019 Brian Canela. All rights reserved.
//

import UIKit

class LeaguesTableViewCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var leagueImage: UIImageView!
    @IBOutlet weak var leagueName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
         cardView.addShadowAndRoundedCorners()
         leagueImage.layer.cornerRadius = cardView.layer.cornerRadius
    }

    func setup(leagueModel: Leagues){
        leagueName.text = leagueModel.title
        
        if let leagueImg = UIImage(named: leagueModel.imageName) {
            leagueImage.alpha = 0.3
            leagueImage.image = leagueImg
            
            UIView.animate(withDuration: 1) {
                self.leagueImage.alpha = 1
            }
        }   
    }
}
