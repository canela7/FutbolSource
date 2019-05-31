//
//  LeagueViewCell.swift
//  Futbol Source
//
//  Created by Brian Canela on 5/30/19.
//  Copyright © 2019 Brian Canela. All rights reserved.
//

import UIKit

class LeagueViewCell: UITableViewCell {

    @IBOutlet weak var countryLeagueImg: UIImageView!
    @IBOutlet weak var leagueNameTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        countryLeagueImg.layer.cornerRadius = 12;
    }

    func configureCell(category: Leagues){
        countryLeagueImg.image = UIImage(named: category.imageName)
        leagueNameTitle.text = category.title
//        categoryImg.image = UIImage(named: category.imageName)
//        categoryTitle.text = category.title
    }

}
