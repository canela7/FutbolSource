//
//  LeagueAPI.swift
//  Futbol Source
//
//  Created by Brian Canela on 5/31/19.
//  Copyright © 2019 Brian Canela. All rights reserved.
//

import Foundation

class LeagueAPI {
    
    func getLeagueURLSession(){
        
        guard let url = URL(string: LEAGUE_URL) else {
            print("Error getting LEAGUE_URL. FILE: LEAGUE_API")
            return
            
        }
        //network request
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
           
            guard error == nil else{
                debugPrint(error.debugDescription)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let jsonAny = try JSONSerialization.jsonObject(with: data, options: [])
                guard let json = jsonAny as? [String: Any] else {
                    return
                }
                
                print(json)

            }catch {
                debugPrint(error.localizedDescription)
                return
            }
            print("League Data = \(data)")
            print("Response = \(response)")
        }
        task.resume()
    }
    
    
}
