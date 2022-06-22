//
//  LeagueDetailsModelController.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 22/06/2022.
//

import Foundation

class LeaguesModelController: ILeaguesModel {
    
    let apiServiceForLeagues: ApiServiceForLeagues = NetworkManager()
    let iLeaguesPresenter: ILeaguesPresenter
    
    init(iLeaguesPresenter: ILeaguesPresenter) {
        self.iLeaguesPresenter = iLeaguesPresenter
    }
    
    
    
    
    func fetchDataFromApi(endPoint: String) {
        apiServiceForLeagues.fetchLeagues(endPoint: endPoint) { leagues, error in
            if let leagues = leagues {
                self.iLeaguesPresenter.onSuccess(leagues: leagues)
            }
            if let error = error {
                self.iLeaguesPresenter.onFail(error: error)
            }
        }
    }
    
    
}
