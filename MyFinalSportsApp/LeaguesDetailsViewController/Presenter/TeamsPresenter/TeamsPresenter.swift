//
//  TeamsPresenter.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 23/06/2022.
//

import Foundation
class TeamsPresenter: ITeamsPresenter {
    
    let iTeamsView: ITeamsView
    
    init(iTeamsView: ITeamsView) {
        self.iTeamsView = iTeamsView
    }
    
    
    
    func onSuccess(teams: TeamsList) {
        iTeamsView.renderTeamsView(teams: teams)
    }
 
    
    func fetchData(endPoint: String) {
        // telling him that iam respobsible of implementing the methods you will call 222
       
        let teamModel = TeamsModelController(iTeamsPresenter: self)
        teamModel.fetchDataFromApi(endPoint: endPoint)
        
    }
    
    func onFail(error: Error) {
        iTeamsView.postTeamsView(error: error)
    }
    
    
    
    
}
