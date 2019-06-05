//
//  LeaguesCollectionViewCell.swift
//  Futbol Source
//
//  Created by Brian Canela on 5/31/19.
//  Copyright © 2019 Brian Canela. All rights reserved.
//

import UIKit

class TeamsCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var teamsImage: UIImageView!
    
    @IBOutlet weak var teamsNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        teamsImage.layer.cornerRadius =  CGFloat(roundf(Float(self.teamsImage.frame.size.width / 2.0)))
        teamsNameLabel.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
    }
    
    
    func configureCell(league: Teams){
        teamsNameLabel.text = league.title
        
        if let url = NSURL(string: league.imageName) {
            if let data = NSData(contentsOf: url as URL){
                teamsImage.contentMode  = UIView.ContentMode.scaleAspectFit
                teamsImage.alpha = 0.3
                teamsImage.image = UIImage(data: data as Data)
                
                UIView.animate(withDuration: 1.5) {
                    self.teamsImage.alpha = 1
                }
            }
        }
    }
    
}
