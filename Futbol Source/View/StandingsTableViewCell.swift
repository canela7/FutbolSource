//
//  StandingsTableViewCell.swift
//  Futbol Source
//
//  Created by Brian Canela on 6/8/19.
//  Copyright © 2019 Brian Canela. All rights reserved.
//

import Foundation
import UIKit


class StandingsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamPointsLabel: UILabel!
    @IBOutlet weak var teamImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
         cardView.addShadowAndRoundedCorners()
      
    }
    
    
    
    func setup(standingsModel: Standings){
        
        rankLabel.text = "\(standingsModel.rank)"
        teamNameLabel.text = standingsModel.teamName
        teamPointsLabel.text = "\(standingsModel.teamPoints)"
        
        
        if let url = NSURL(string: standingsModel.leagueLogo) {
            if let data = NSData(contentsOf: url as URL){
                teamImage.contentMode  = UIView.ContentMode.scaleAspectFit
                teamImage.alpha = 0.3
                teamImage.image = UIImage(data: data as Data)
                
                UIView.animate(withDuration: 1.5) {
                    self.teamImage.alpha = 1
                }
            }
        }
    }

    
    
    
    
}
