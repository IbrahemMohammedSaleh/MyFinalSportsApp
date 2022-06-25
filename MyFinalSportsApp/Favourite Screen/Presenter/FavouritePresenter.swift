//
//  FavouritePresenter.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 23/06/2022.
//

import Foundation



class LeaguesForFavouritePresenter: ILeaguesForFavouritePresenter  {
    
        let iLeaguesForFavouriteView: ILeaguesForFavouriteView
 
    
        init(iLeaguesForFavouriteView: ILeaguesForFavouriteView) {
            self.iLeaguesForFavouriteView = iLeaguesForFavouriteView
        }

    func fetchData() {
     
        let leaguesForFavouriteModel = LeaguesForFavouriteModelController(iLeaguesForFavouritePresenter: self) // 2
        leaguesForFavouriteModel.fetchDataFromApi()
    }
    
    func onFail(error: Error) {
        iLeaguesForFavouriteView.postErrorLeaguesForFavouriteView(error: error)
    }
    
    func onSuccess(countries: AllLeagueByStrSport){
        iLeaguesForFavouriteView.renderLeaguesForFavouriteView(countries: countries)
    }
    
    


}
