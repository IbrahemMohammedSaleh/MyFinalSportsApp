//
//  Leagues.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 20/06/2022.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let sportsList = try? newJSONDecoder().decode(SportsList.self, from: jsonData)



struct Leagues: Codable {
    let leagues: [League]
 
}


// MARK: - League
struct League: Codable {
    let idLeague, strLeague, strSport: String
    let strLeagueAlternate: String?
}
