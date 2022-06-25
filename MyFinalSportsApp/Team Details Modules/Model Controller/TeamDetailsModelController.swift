//
//  TeamDetailsModelController.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 23/06/2022.
//

import Foundation
class TeamDetailsModelController: ITeamDetailsModel {
   
    let apiServiceForTeamDetails: ApiServiceForTeamDetails = NetworkManager()
    let iTeamDetailsPresenter: ITeamDetailsPresenter
    
    init(iTeamDetailsPresenter: ITeamDetailsPresenter) {
        self.iTeamDetailsPresenter = iTeamDetailsPresenter
    }
    
    
    func fetchDataFromApi() {
        apiServiceForTeamDetails.fetchTeamDetails() { teams, error in
            if let teams = teams {
                self.iTeamDetailsPresenter.onSuccess(teams: teams)
            }
            if let error = error {
                self.iTeamDetailsPresenter.onFail(error: error)
            }
        }
    }
    
    //Calling data from network and passing it to presenter
    

    
}
