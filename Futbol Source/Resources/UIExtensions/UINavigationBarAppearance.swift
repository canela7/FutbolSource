//
//  UINavigationBarAppearance.swift
//  Futbol Source
//
//  Created by Brian Canela on 5/30/19.
//  Copyright © 2019 Brian Canela. All rights reserved.
//

import UIKit

class UINavigationBarAppearance: UINavigationBar {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        barTintColor = Theme.navBarColor
        isTranslucent = false
    }

}
