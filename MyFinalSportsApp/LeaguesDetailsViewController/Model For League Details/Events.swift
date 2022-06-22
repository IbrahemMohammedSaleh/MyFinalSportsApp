//
//  Events.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 21/06/2022.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let sportsList = try? newJSONDecoder().decode(SportsList.self, from: jsonData)

import Foundation

// MARK: - SportsList
struct EventsList: Codable {
    let events: [Event]
}

// MARK: - Event
struct Event: Codable {
    let idEvent: String
    let idSoccerXML, idAPIfootball: JSONNull?
    let strEvent, strEventAlternate, strFilename: String
    let strSport: StrSport
    let idLeague: String
    let strLeague: StrLeague
    let strSeason: StrSeason
    let strDescriptionEN: JSONNull?
    let strHomeTeam, strAwayTeam: StrTeam
    let intHomeScore, intRound, intAwayScore: String
    let intSpectators, strOfficial: JSONNull?
    let strTimestamp, dateEvent: String
    let dateEventLocal: JSONNull?
    let strTime: String
    let strTimeLocal, strTVStation: JSONNull?
    let idHomeTeam, idAwayTeam: String
    let intScore, intScoreVotes, strResult: JSONNull?
    let strVenue: String
    let strCountry, strCity: JSONNull?
    let strPoster, strSquare, strFanart, strThumb: String
    let strBanner: String
    let strMap, strTweet1, strTweet2, strTweet3: JSONNull?
    let strVideo, strStatus: JSONNull?
    let strPostponed: StrPostponed
    let strLocked: StrLocked
}

enum StrTeam: String, Codable {
    case adelaideGiants = "Adelaide Giants"
    case brisbaneBandits = "Brisbane Bandits"
    case canberraCavalry = "Canberra Cavalry"
    case melbourneAces = "Melbourne Aces"
    case perthHeat = "Perth Heat"
    case sydneyBlueSox = "Sydney Blue Sox"
}

enum StrLeague: String, Codable {
    case australianBaseballLeague = "Australian Baseball League"
}

enum StrLocked: String, Codable {
    case unlocked = "unlocked"
}

enum StrPostponed: String, Codable {
    case no = "no"
}

enum StrSeason: String, Codable {
    case the20122013 = "2012-2013"
}

enum StrSport: String, Codable {
    case baseball = "Baseball"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
