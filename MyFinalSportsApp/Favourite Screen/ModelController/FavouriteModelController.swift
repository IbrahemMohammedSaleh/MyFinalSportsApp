//
//  ModelController.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 23/06/2022.
//

import Foundation
class LeaguesForFavouriteModelController: ILeaguesForFavouriteModel {
    
    let apiServiceForLeaguesForFavourite: ApiServiceForFavouriteLeagues = NetworkManager()
 
    
    
    let iLeaguesForFavouritePresenter: ILeaguesForFavouritePresenter
    
    init(iLeaguesForFavouritePresenter: ILeaguesForFavouritePresenter) {
        self.iLeaguesForFavouritePresenter = iLeaguesForFavouritePresenter
    }
    
    
    
    
    func fetchDataFromApi() {
        apiServiceForLeaguesForFavourite.fetchLeaguesForFavourites() { countries, error in
            if let countries = countries {
                self.iLeaguesForFavouritePresenter.onSuccess(countries: countries)
        }
            if let error = error {
                self.iLeaguesForFavouritePresenter.onFail(error: error)
            }
        }
    }
    
    
}
