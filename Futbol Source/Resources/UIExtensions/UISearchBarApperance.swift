//
//  UISearchBarApperance.swift
//  Futbol Source
//
//  Created by Brian Canela on 5/30/19.
//  Copyright © 2019 Brian Canela. All rights reserved.
//

import UIKit

fileprivate var blurView: UIView?

class UISearchBarApperance: UISearchBar {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        barTintColor = Theme.navBarColor
        isTranslucent = false
        placeholder = "Search for a Team"
        searchBarStyle = .minimal
        backgroundColor = Theme.navBarColor.withAlphaComponent(0.95)
        
        // SearchBar text
        let textFieldInsideUISearchBar = value(forKey: "searchField") as? UITextField
        textFieldInsideUISearchBar?.textColor = UIColor.white
    }
    


    
    

}
