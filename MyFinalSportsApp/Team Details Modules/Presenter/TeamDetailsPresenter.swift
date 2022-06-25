//
//  TeamDetailsPresenter.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 23/06/2022.
//

import Foundation
class TeamDetailsPresenter: ITeamDetailsPresenter {
    func onSuccess(teams: TeamsList) {
        iTeamDetailsView.renderTeamDetailsView(teams: teams)
    }
    
    
    let iTeamDetailsView: ITeamDetailsView
    
    init(iTeamDetailsView: ITeamDetailsView) {
        self.iTeamDetailsView = iTeamDetailsView
    }
    
    
    
//    func onSuccess(teams: TeamDetails) {
//        iTeamDetailsView.renderTeamDetailsView(teams: teams)
//    }
 
    
    func fetchData() {
        // telling him that iam respobsible of implementing the methods you will call 222
       
        let teamDetailModel = TeamDetailsModelController(iTeamDetailsPresenter: self)
        teamDetailModel.fetchDataFromApi()
        
    }
    
    func onFail(error: Error) {
        iTeamDetailsView.postTeamDetailsView(error: error)
    }
    
    
    
    
}
