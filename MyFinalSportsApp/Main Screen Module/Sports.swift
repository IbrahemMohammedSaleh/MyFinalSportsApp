//
//  Sports.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 20/06/2022.
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let sportsList = try? newJSONDecoder().decode(SportsList.self, from: jsonData)

import Foundation

// MARK: - SportsList
struct SportsList: Codable {
    let sports: [Sport]
}

// MARK: - Sport
struct Sport: Codable {
    let idSport, strSport: String
    let strFormat: StrFormat
    let strSportThumb: String
    let strSportIconGreen: String
    let strSportDescription: String
}

enum StrFormat: String, Codable {
    case eventSport = "EventSport"
    case teamvsTeam = "TeamvsTeam"
}
