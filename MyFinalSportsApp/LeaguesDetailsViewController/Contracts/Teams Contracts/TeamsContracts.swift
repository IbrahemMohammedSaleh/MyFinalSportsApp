//
//  TeamsContracts.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 22/06/2022.
//

import Foundation
protocol ITeamsView {
    func renderTeamsView(teams: TeamsList)
    func postTeamsView(error: Error)
}
protocol ITeamsPresenter {  // For Presenter
    func fetchData()
    func onSuccess(teams: TeamsList)
    func onFail(error: Error)
}
protocol ITeamsModel { // For Model
    func fetchDataFromApi()
}

