//
//  MainScreenContract.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 22/06/2022.
//

import Foundation



protocol ILeagueDetailsView {
    func renderLeagueDetailsView(events: EventsList)
    func postLeagueDetailsView(error: Error)
}
protocol ILeagueDetailsPresenter {  // For Presenter
    func fetchData(endPoint: String)
    func onSuccess(events: EventsList)
    func onFail(error: Error)
}
protocol ILeagueDetailsModel { // For Model
    func fetchDataFromApi(endPoint: String)
}
