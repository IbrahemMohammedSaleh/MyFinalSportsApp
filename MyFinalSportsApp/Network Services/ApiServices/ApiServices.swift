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
    func fetchLeagues(endPoint: String, completion: @escaping ((AllLeagueByStrSport?, Error?) -> Void))
}
protocol ApiServiceForEvents {    // Dependency Injection
    func fetchEventsList(endPoint: String, completion: @escaping ((EventsList?, Error?) -> Void))
}
protocol ApiServiceForTeams {    // Dependency Injection
    func fetchTeams(endPoint: String, completion: @escaping ((TeamsList?, Error?) -> Void))
}
protocol ApiServiceForLatest {    // Dependency Injection
    func fetchLatest(endPoint: String, completion: @escaping ((EventsList?, Error?) -> Void))
}
protocol ApiServiceForTeamDetails {    // Dependency Injection
    func fetchTeamDetails(endPoint: String, completion: @escaping ((TeamsList?, Error?) -> Void))
}
//protocol ApiServiceForLeagues {    // Dependency Injection
//    func fetchLeagues(endPoint: String, completion: @escaping ((AllLeagues?, Error?) -> Void))
//}
