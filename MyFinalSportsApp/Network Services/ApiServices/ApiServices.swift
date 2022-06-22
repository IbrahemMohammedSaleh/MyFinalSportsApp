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

protocol ApiServiceForEvents {    // Dependency Injection
    func fetchEventsList(endPoint: String, completion: @escaping ((EventsList?, Error?) -> Void))
}
protocol ApiServiceForTeams {    // Dependency Injection
    func fetchTeams(endPoint: String, completion: @escaping ((Teams?, Error?) -> Void))
}
