//
//  Network .swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 19/06/2022.
//

import Foundation

class NetworkManager: ApiServiceForSportsList, ApiServiceForLeagues, ApiServiceForEvents, ApiServiceForTeams, ApiServiceForLatest, ApiServiceForTeamDetails {
    func fetchTeamDetails(endPoint: String, completion: @escaping ((TeamsList?, Error?) -> Void)) {
        if let  url = URL(string: UrlServices(endPoint: endPoint).url) {
                    URLSession.shared.dataTask(with: url) { data, response, error in
                        if let data = data {
        
                            let decodedArray: TeamsList = convertFromJson(data: data) ?? TeamsList(teams: [])
                            completion(decodedArray.self,nil)
                        }
                        if let error = error {
                           completion(nil, error)
                        }
                    }.resume()
                }
    }
    
    func fetchLatest(endPoint: String, completion: @escaping ((EventsList?, Error?) -> Void)) {
        if let  url = URL(string: UrlServices(endPoint: endPoint).url) {
                    URLSession.shared.dataTask(with: url) { data, response, error in
                        if let data = data {
        
                            let decodedArray: EventsList = convertFromJson(data: data) ?? EventsList(events: [])
                            completion(decodedArray.self,nil)
                        }
                        if let error = error {
                           completion(nil, error)
                        }
                    }.resume()
                }
    }
    
    
    
    func fetchEventsList(endPoint: String, completion: @escaping ((EventsList?, Error?) -> Void)) {
        if let  url = URL(string: UrlServices(endPoint: endPoint).url) {
                    URLSession.shared.dataTask(with: url) { data, response, error in
                        if let data = data {
        
                            let decodedArray: EventsList = convertFromJson(data: data) ?? EventsList(events: [])
                            completion(decodedArray.self,nil)
                        }
                        if let error = error {
                           completion(nil, error)
                        }
                    }.resume()
                }
    }
    
    func fetchTeams(endPoint: String, completion: @escaping ((TeamsList?, Error?) -> Void)) {
        if let  url = URL(string: UrlServices(endPoint: endPoint).url) {
                    URLSession.shared.dataTask(with: url) { data, response, error in
                        if let data = data {
        
                            let decodedArray: TeamsList = convertFromJson(data: data) ?? TeamsList(teams: [])
                            completion(decodedArray.self,nil)
                        }
                        if let error = error {
                           completion(nil, error)
                        }
                    }.resume()
                }
    }
    
  
    
    func fetchLeagues(endPoint: String, completion: @escaping ((AllLeagueByStrSport?, Error?) -> Void)) {
        if let  url = URL(string: UrlServices(endPoint: endPoint).url) {
                    URLSession.shared.dataTask(with: url) { data, response, error in
                        if let data = data {
        
                            let decodedArray: AllLeagueByStrSport = convertFromJson(data: data) ?? AllLeagueByStrSport(countries: [])
                            completion(decodedArray.self,nil)
                        }
                        if let error = error {
                           completion(nil, error)
                        }
                    }.resume()
                }
    }
   
    
    
    func fetchSportsList(endPoint: String, completion: @escaping ((SportsList?, Error?) -> Void)) {
        if let  url = URL(string: UrlServices(endPoint: endPoint).url) {
                    URLSession.shared.dataTask(with: url) { data, response, error in
                        if let data = data {
        
                            let decodedArray: SportsList = convertFromJson(data: data) ?? SportsList(sports: [])
                            completion(decodedArray.self,nil)
                        }
                        if let error = error {
                           completion(nil, error)
                        }
                    }.resume()
                }
        
            }

    
    
    }
    
 
   
//MARK:- UnComment For All Leagues
//    func fetchLeagues(endPoint: String, completion: @escaping ((AllLeagueByStrSport?, Error?) -> Void)) {
//        if let  url = URL(string: UrlServices(endPoint: endPoint).url) {
//                    URLSession.shared.dataTask(with: url) { data, response, error in
//                        if let data = data {
//
//                            let decodedArray: AllLeagueByStrSport = convertFromJson(data: data) ?? AllLeagues(leagues: [])
//                            completion(decodedArray.self,nil)
//                        }
//                        if let error = error {
//                           completion(nil, error)
//                        }
//                    }.resume()
//                }
//    }

 
