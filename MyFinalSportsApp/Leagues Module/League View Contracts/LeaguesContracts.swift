//
//  LeagueDetailsContracts.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 22/06/2022.
//

import Foundation

protocol ILeaguesView { // For home View
    func renderLeagueDetailsView(countries: AllLeagueByStrSport)
    func postErrorLeagueDetailsView(error: Error)
}

protocol ILeaguesPresenter {  // For Presenter
    func fetchData()
    func onSuccess(countries: AllLeagueByStrSport)
    func onFail(error: Error)
}

protocol ILeaguesModel { // For Model
    func fetchDataFromApi()
}
//protocol ILeaguesView { // For home View
//    func renderLeagueDetailsView(leagues: AllLeagues)
//    func postErrorLeagueDetailsView(error: Error)
//}
//protocol ILeaguesPresenter {  // For Presenter
//    func fetchData(endPoint: String)
//    func onSuccess(leagues: AllLeagues)
//    func onFail(error: Error)
//}
