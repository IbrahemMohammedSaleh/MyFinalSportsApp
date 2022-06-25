//
//  TeamsModelController.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 23/06/2022.
//

import Foundation
class TeamsModelController: ITeamsModel {
   

    
    let apiServiceForTeams: ApiServiceForTeams = NetworkManager()
    let iTeamsPresenter: ITeamsPresenter
    
    init(iTeamsPresenter: ITeamsPresenter) {
        self.iTeamsPresenter = iTeamsPresenter
    }
    
    
    func fetchDataFromApi() {
        apiServiceForTeams.fetchTeams() { teams, error in
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
