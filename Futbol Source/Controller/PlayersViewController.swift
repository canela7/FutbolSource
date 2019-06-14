//
//  PlayersViewController.swift
//  Futbol Source
//
//  Created by Brian Canela on 6/13/19.
//  Copyright © 2019 Brian Canela. All rights reserved.
//

import UIKit

class PlayersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        navigationItem.title = "Players";
    }
    
    
    
    @IBAction func returnToTeams(_ sender: Any) {
        dismiss(animated: true) 
    }
    


}

extension PlayersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
