//
//  PlayersTableViewCell.swift
//  Futbol Source
//
//  Created by Brian Canela on 6/13/19.
//  Copyright © 2019 Brian Canela. All rights reserved.
//

import UIKit

class PlayersTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var playerPositionLabel: UILabel!
    @IBOutlet weak var playerAgeLabel: UILabel!
    @IBOutlet weak var playerNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardView.addShadowAndRoundedCorners()
    }
    
    func setup(player: Players){
        playerPositionLabel.text = player.playerPosition
        playerAgeLabel.text = "\(player.playerAge)"
        playerNameLabel.text = player.playerName
    }

  
}
