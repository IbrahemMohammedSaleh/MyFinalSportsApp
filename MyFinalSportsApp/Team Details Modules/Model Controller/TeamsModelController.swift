//
//  TeamsModelController.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 22/06/2022.
//

import Foundation
class TeamsModelController: ITeamsModel {
   

    
    let apiServiceForTeams: ApiServiceForTeams = NetworkManager()
    let iTeamsPresenter: ITeamsPresenter
    
    init(iTeamsPresenter: ITeamsPresenter) {
        self.iTeamsPresenter = iTeamsPresenter
    }
    
    
    func fetchDataFromApi(endPoint: String) {
        apiServiceForTeams.fetchTeams(endPoint: endPoint) { teams, error in
            if let teams = teams {
                self.iTeamsPresenter.onSuccess(teams: teams)
            }
            if let error = error {
                self.iTeamsPresenter.onFail(error: error)
            }
        }
    }
    
    //Calling data from network and passing it to presenter
    

    
}
