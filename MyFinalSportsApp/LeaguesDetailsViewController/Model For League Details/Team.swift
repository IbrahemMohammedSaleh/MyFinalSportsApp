//
//  Team.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 23/06/2022.
//

import Foundation
struct TeamsList: Codable {
    let teams: [Team]
}

// MARK: - Event
struct Team: Codable {
    let idTeam, idLeague, strTeam, strLeague, strSport, strTeamBadge: String
    let strTeamLogo, strStadium: String?
    let strWebsite, strYoutube, strTwitter, strInstagram, strFacebook : String?
    let strTeamJersey: String?
}
//search_all_teams.php?l=English%20Premier%20League
