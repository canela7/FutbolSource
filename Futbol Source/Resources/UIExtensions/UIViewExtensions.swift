//
//  UIViewExtensions.swift
//  Futbol Source
//
//  Created by Brian Canela on 6/3/19.
//  Copyright © 2019 Brian Canela. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
    
    func addShadowAndRoundedCorners(){
        backgroundColor = #colorLiteral(red: 0.2862745098, green: 0.2862745098, blue: 0.2862745098, alpha: 1).withAlphaComponent(0.85)
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.cornerRadius = CGFloat(roundf(Float(layer.frame.size.height / 2.0)));
    }
    
    
}
