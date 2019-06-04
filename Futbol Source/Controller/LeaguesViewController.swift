//
//  LeaguesViewController.swift
//  Futbol Source
//
//  Created by Brian Canela on 6/3/19.
//  Copyright © 2019 Brian Canela. All rights reserved.
//

import UIKit

private let reuseIdentifier = "leaguesCell"

class LeaguesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let data = DataSet()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.layer.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        navigationItem.title = "Leagues";
        // Do any additional setup after loading the view.
    }
    


}


extension LeaguesViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as! LeaguesTableViewCell
        cell.setup(leagueModel: data.categories[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }

    
}
