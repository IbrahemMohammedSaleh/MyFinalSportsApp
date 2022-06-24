//
//  TeamDetailsContract.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 23/06/2022.
//

import Foundation
protocol ITeamDetailsView {
    func renderTeamDetailsView(teams: TeamsList)
    
    func postTeamDetailsView(error: Error)
}
protocol ITeamDetailsPresenter {  // For Presenter
    func fetchData(endPoint: String)
    func onSuccess(teams: TeamsList)
    func onFail(error: Error)
}
protocol ITeamDetailsModel { // For Model
    func fetchDataFromApi(endPoint: String)
}
