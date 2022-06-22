//
//  TeamsPresenter.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 22/06/2022.
//

import Foundation
class TeamsPresenter: ITeamsPresenter {
    
    let iTeamsView: ITeamsView
    init(iTeamsView: ITeamsView) {
        self.iTeamsView = iTeamsView
    }

    
    
    func fetchData(endPoint: String) {

        let teamsModel = TeamsModelController(iTeamsPresenter: self)
        teamsModel.fetchDataFromApi(endPoint: endPoint)
    }
    
    func onSuccess(teams: Teams) {
        iTeamsView.renderTeamsView(teams: teams)
    }
    
    func onFail(error: Error) {
        iTeamsView.postTeamsView(error: error)
    }
    
    
}


