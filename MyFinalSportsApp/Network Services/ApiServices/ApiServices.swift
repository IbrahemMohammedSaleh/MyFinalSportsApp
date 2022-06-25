//
//  ApiServices.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 19/06/2022.
//

import Foundation


protocol ApiServiceForSportsList {    // Dependency Injection
    func fetchSportsList(completion: @escaping ((SportsList?, Error?) -> Void))
}
protocol ApiServiceForLeagues {    // Dependency Injection
    func fetchLeagues(completion: @escaping ((AllLeagueByStrSport?, Error?) -> Void))
}
protocol ApiServiceForEvents {    // Dependency Injection
    func fetchEventsList(completion: @escaping ((EventsList?, Error?) -> Void))
}
protocol ApiServiceForTeams {    // Dependency Injection
    func fetchTeams(completion: @escaping ((TeamsList?, Error?) -> Void))
}
protocol ApiServiceForLatest {    // Dependency Injection
    func fetchLatest(completion: @escaping ((EventsList?, Error?) -> Void))
}
protocol ApiServiceForTeamDetails {    // Dependency Injection
    func fetchTeamDetails(completion: @escaping ((TeamsList?, Error?) -> Void))
}

protocol ApiServiceForFavouriteLeagues {    // Dependency Injection
    func fetchLeaguesForFavourites(completion: @escaping ((AllLeagueByStrSport?, Error?) -> Void))
}


//protocol ApiServiceForLeagues {    // Dependency Injection
//    func fetchLeagues(endPoint: String, completion: @escaping ((AllLeagues?, Error?) -> Void))
//}
