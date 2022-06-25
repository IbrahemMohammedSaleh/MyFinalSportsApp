//
//  Sports.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 20/06/2022.
//


import Foundation

// MARK: - SportsList
 struct SportsList: Codable {
    let sports: [Sport]
    
}

// MARK: - Sport
struct Sport: Codable {
    let idSport: String
    let strSport: String
    let strFormat: StrFormat
    let strSportThumb: String
    let strSportIconGreen: String
    let strSportDescription: String
}


enum StrFormat: String, Codable {
    case eventSport = "EventSport"
    case teamvsTeam = "TeamvsTeam"
}

struct AllCountries: Codable {
    let countries: [Countries]?
}

struct Countries: Codable {

    let nameEn: String
}
