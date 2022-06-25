//
//  Network .swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 19/06/2022.
//

import Foundation

class NetworkManager: ApiServiceForSportsList, ApiServiceForLeagues, ApiServiceForEvents, ApiServiceForTeams, ApiServiceForLatest, ApiServiceForTeamDetails, ApiServiceForFavouriteLeagues {
    func fetchLeagues(completion: @escaping ((AllLeagueByStrSport?, Error?) -> Void)) {
        let endPointLeagues = EndPoint.AlleagueEndPoint.rawValue
        if let  url = URL(string: UrlServices(endPoint: endPointLeagues).url) {
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
    
    func fetchEventsList(completion: @escaping ((EventsList?, Error?) -> Void)) {
        let endPointEvents = EndPoint.eventsEndPoint.rawValue
        
        if let  url = URL(string: UrlServices(endPoint: endPointEvents).url) {
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
    
    func fetchTeams(completion: @escaping ((TeamsList?, Error?) -> Void)) {
        let endPointTeams = EndPoint.teamsEndPoint.rawValue
        
        if let  url = URL(string: UrlServices(endPoint: endPointTeams).url) {
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
    
    func fetchLeaguesForFavourites(completion: @escaping ((AllLeagueByStrSport?, Error?) -> Void)) {
        
        let endPointFavourites = EndPoint.teamsEndPoint.rawValue
        
        if let  url = URL(string: UrlServices(endPoint: endPointFavourites).url) {
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
    
    func fetchTeamDetails(completion: @escaping ((TeamsList?, Error?) -> Void)) {
        
        let endPointTeams = EndPoint.teamsEndPoint.rawValue
        
        if let  url = URL(string: UrlServices(endPoint: endPointTeams).url) {
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
    
    func fetchLatest(completion: @escaping ((EventsList?, Error?) -> Void)) {
        
        let endPointLatest = EndPoint.eventsEndPoint.rawValue
        
        if let  url = URL(string: UrlServices(endPoint: endPointLatest).url) {
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
    
    
    
//    func fetchEventsList(endPoint: String, completion: @escaping ((EventsList?, Error?) -> Void)) {
//
//        let endPointEvents = EndPoint.eventsEndPoint.rawValue
//
//        if let  url = URL(string: UrlServices(endPoint: endPointEvents).url) {
//                    URLSession.shared.dataTask(with: url) { data, response, error in
//                        if let data = data {
//
//                            let decodedArray: EventsList = convertFromJson(data: data) ?? EventsList(events: [])
//                            completion(decodedArray.self,nil)
//                        }
//                        if let error = error {
//                           completion(nil, error)
//                        }
//                    }.resume()
//                }
//    }
    
//    func fetchTeams(endPoint: String, completion: @escaping ((TeamsList?, Error?) -> Void)) {
//
//        let endPointTeams = EndPoint.teamsEndPoint.rawValue
//
//        if let  url = URL(string: UrlServices(endPoint: endPointTeams).url) {
//                    URLSession.shared.dataTask(with: url) { data, response, error in
//                        if let data = data {
//
//                            let decodedArray: TeamsList = convertFromJson(data: data) ?? TeamsList(teams: [])
//                            completion(decodedArray.self,nil)
//                        }
//                        if let error = error {
//                           completion(nil, error)
//                        }
//                    }.resume()
//                }
//    }
    
  
//
//    func fetchLeagues(endPoint: String, completion: @escaping ((AllLeagueByStrSport?, Error?) -> Void)) {
//
//        let endPointLeagues = EndPoint.AlleagueEndPoint.rawValue
//        if let  url = URL(string: UrlServices(endPoint: endPointLeagues).url) {
//                    URLSession.shared.dataTask(with: url) { data, response, error in
//                        if let data = data {
//
//                            let decodedArray: AllLeagueByStrSport = convertFromJson(data: data) ?? AllLeagueByStrSport(countries: [])
//                            completion(decodedArray.self,nil)
//                        }
//                        if let error = error {
//                           completion(nil, error)
//                        }
//                    }.resume()
//                }
//    }
//
    
    
    func fetchSportsList( completion: @escaping ((SportsList?, Error?) -> Void)) {
        let endPointSports = EndPoint.sportEndPoint.rawValue
        if let  url = URL(string: UrlServices(endPoint: endPointSports).url) {
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

 
