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
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 10
    }
    
    
}
