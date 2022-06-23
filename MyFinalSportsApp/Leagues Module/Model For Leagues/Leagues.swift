//
//  Leagues.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 20/06/2022.
//

import Foundation


//struct Leagues: Codable {
//    let leagues: [League]
//
//}
//
//
//// MARK: - League
//struct League: Codable {
//    let idLeague, strLeague, strSport: String
//    let strLeagueAlternate: String?
//}


struct AllLeagueByStrSport: Codable {
    let countries: [LeagueByStrSport]
}

struct LeagueByStrSport: Codable {
    var idLeague,strLeague, strSport, strCurrentSeason, strBadge: String
    var strYoutube, strTwitter, strInstagram, strFacebook : String?
}
 
//struct AllLeagues: Codable {
//    let leagues: [League]
//}
//
//// MARK: - League
//struct League: Codable {
//    let idLeague, strLeague, strSport: String
//    let strLeagueAlternate: String?
//}
