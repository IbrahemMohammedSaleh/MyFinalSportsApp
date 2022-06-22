//
//  ApiServices.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 19/06/2022.
//

import Foundation


protocol ApiServiceForSportsList {    // Dependency Injection
    func fetchSportsList(endPoint: String, completion: @escaping ((SportsList?, Error?) -> Void))
}
protocol ApiServiceForLeagues {    // Dependency Injection
    func fetchLeagues(endPoint: String, completion: @escaping ((Leagues?, Error?) -> Void))
}
