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
    
 
    func fetchDataFromApi() {
        apiServiceForLeagues.fetchLeagues() { countries, error in
            if let countries = countries {
                self.iLeaguesPresenter.onSuccess(countries: countries)
            }
            if let error = error {
                self.iLeaguesPresenter.onFail(error: error)
            }
        }
    }
    
    
}
