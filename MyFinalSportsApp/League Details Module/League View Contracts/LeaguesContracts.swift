//
//  LeagueDetailsContracts.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 22/06/2022.
//

import Foundation

protocol ILeaguesView { // For home View
    func renderLeagueDetailsView(leagues: Leagues)
    func postErrorLeagueDetailsView(error: Error)
}

protocol ILeaguesPresenter {  // For Presenter
    func fetchData(endPoint: String)
    func onSuccess(leagues: Leagues)
    func onFail(error: Error)
}

protocol ILeaguesModel { // For Model
    func fetchDataFromApi(endPoint: String)
}
