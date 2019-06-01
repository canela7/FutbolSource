//
//  LeagueAPI.swift
//  Futbol Source
//
//  Created by Brian Canela on 5/31/19.
//  Copyright © 2019 Brian Canela. All rights reserved.
//

import Foundation

private let HEADERS = [
    "X-RapidAPI-Host": "api-football-v1.p.rapidapi.com",
    "X-RapidAPI-Key": "ca2e146046msh8dc312516e7956ep17b4aejsndee61613b763",
]

class LeagueAPI {
    
    //LeaguesResponseCompletion is a typealias of Leagues? -> Void
    
    func getLeagueURLSession(id: Int, completion: @escaping LeaguesResponseCompletion)  {
        
        guard let url = URL(string: "\(LEAGUE_URL)\(id)") else {
            print("Error getting LEAGUE_URL. FILE: LEAGUE_API")
            return
        }
        
        //network request
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
           
            guard error == nil else{
                debugPrint(error.debugDescription)
                
                completion(nil)
                
                return
            }
            
            guard let data = data else { return }
            
            do {
                let jsonAny = try JSONSerialization.jsonObject(with: data, options: [])
                guard let json = jsonAny as? [String: Any] else {
                    return
                }
                
                print("FILE: LEAGUE-API:", json)
                let leagues = self.parseLeaguesManual(json: json)
        
                //back in the main thread
                DispatchQueue.main.async {
                    completion(leagues)
                }
        
        
                print("FILE: LEAGUE-API: ", leagues.title)
                print("FILEL LEAGUE-API:", leagues.imageName)

            }catch {
                debugPrint(error.localizedDescription)
                return
            }
            //print("League Data = \(data)")
            print("Response = \(response)")
        }
        task.resume()
    }
    
    
    
    private func parseLeaguesManual(json: [String: Any]) -> Leagues {
        //our api input is dictionary of key type string and value of any
        //as? String b/c we have value returned in strings
        let leagueName = json["name"] as? String ?? ""
        let leagueLogoImage = json["logo"] as? String ?? ""
        
        let leagues = Leagues(title: leagueName, imageName: leagueLogoImage)
        
        return leagues
        
    }
    
    
}
