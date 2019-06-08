//
//  StandingsAPI.swift
//  Futbol Source
//
//  Created by Brian Canela on 6/8/19.
//  Copyright © 2019 Brian Canela. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON



class StandingsAPI {
    
    var standings = [Standings]()
    
    
    func getTeamAlamoFire(id: Int, completion: @escaping StandingsResponseCompletion) {
        
        guard let url = URL(string: "\(STANDINGS_URL)\(id)") else {
            print("Error getting LEAGUE_URL. FILE: LEAGUE_API")
            return
        }
        
        let parameters: Parameters = ["id": id.description]
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: HEADERS).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = response.data else { return completion(nil)}
            
            do {
                let json = try JSON(data: data)
                let standing = self.parseStandingsSwifty(json: json)
                
                DispatchQueue.global(qos: .userInteractive).async {
                    DispatchQueue.main.async {
                        
                        completion(standing)
                    }
                }
                
            }catch{
                debugPrint(error.localizedDescription)
            }
        }
        
    }
    
    
    private func parseStandingsSwifty(json: JSON) -> [Standings] {
    
        return standings
    }
    
    
}
