//
//  Events.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 21/06/2022.
//


import Foundation

// MARK: - SportsList
struct EventsList: Codable {
    let events: [Event]
}

// MARK: - Event
struct Event: Codable {
    var idEvent: String
    var strSport: String
    let strEvent, strEventAlternate, strFilename: String
    let strHomeTeam, strAwayTeam: String
    let idLeague: String
    let strLeague: String
    let intHomeScore , intAwayScore: String
    let strSeason: String
    let dateEvent,intRound, strTime : String
    

}


//"eventsseason.php?id=4617"
