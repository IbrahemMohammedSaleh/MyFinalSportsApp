//
//  Urls.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 19/06/2022.
//

import Foundation



struct UrlServices {
    var endPoint: String = ""
    var url: String {
        return "https://www.thesportsdb.com/api/v1/json/2/\(endPoint)"
    }
}

enum EndPoint: String {
    
    case teamsEndPoint = "search_all_teams.php?l=English%20Premier%20League"
    case AlleagueEndPoint = "search_all_leagues.php?s=Soccer"
    case eventsEndPoint = "eventsseason.php?id=4617"
    case sportEndPoint = "all_sports.php"
}

