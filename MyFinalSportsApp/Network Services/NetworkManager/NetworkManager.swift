//
//  Network .swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 19/06/2022.
//

import Foundation

class NetworkManager: ApiServiceForSportsList, ApiServiceForLeagues {
    func fetchLeagues(endPoint: String, completion: @escaping ((Leagues?, Error?) -> Void)) {
        if let  url = URL(string: UrlServices(endPoint: endPoint).url) {
                    URLSession.shared.dataTask(with: url) { data, response, error in
                        if let data = data {
        
                            let decodedArray: Leagues = convertFromJson(data: data) ?? Leagues(leagues: [])
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
    
 
   
    

    
//    func fetchUsers(endPoint: String, completion: @escaping ((SportsList?, Error?) -> Void)) {
//
//        if let  url = URL(string: UrlServices(endPoint: endPoint).url) {
//            URLSession.shared.dataTask(with: url) { data, response, error in
//                if let data = data {
//
//                    let decodedArray: SportsList = convertFromJson(data: data) ?? SportsList(sports: [])
//                    completion(decodedArray.self,nil)
//                }
//                if let error = error {
//                   completion(nil, error)
//                }
//            }.resume()
//        }
//
//    }
