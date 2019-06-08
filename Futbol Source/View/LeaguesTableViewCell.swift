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
        leagueImage.layer.cornerRadius = CGFloat(roundf(Float(self.leagueImage.frame.size.width / 2.0)));
    }

    func setup(leagueModel: Leagues){
        leagueName.text = leagueModel.leagueTitle

        if let url = NSURL(string: leagueModel.leagueLogo) {
            if let data = NSData(contentsOf: url as URL){
                leagueImage.contentMode  = UIView.ContentMode.scaleAspectFit
                leagueImage.alpha = 0.3
                leagueImage.image = UIImage(data: data as Data)
                
                UIView.animate(withDuration: 1.5) {
                    self.leagueImage.alpha = 1
                }
            }
        }
    }
    
    
    
}
