//
//  ViewController.swift
//  Futbol Source
//
//  Created by Brian Canela on 5/30/19.
//  Copyright © 2019 Brian Canela. All rights reserved.
//

import UIKit

class LeaguesController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    

    @IBOutlet weak var tableView: UITableView!
    
     let data = DataSet()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.categories.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "leaguesViewCell", for: indexPath) as? LeagueViewCell {
            cell.configureCell(category: data.categories[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200;
    }


}

