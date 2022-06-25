//
//  FavouritePresenter.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 23/06/2022.
//

import Foundation



class LeaguesForFavouritePresenter: ILeaguesForFavouritePresenter  {
    
        let iLeaguesForFavouriteView: ILeaguesForFavouriteView
        // calling methods to render 333
    
        init(iLeaguesForFavouriteView: ILeaguesForFavouriteView) {
            self.iLeaguesForFavouriteView = iLeaguesForFavouriteView
        }
    
    
    
    
    func fetchData() {
        // telling him that iam respobsible of implementing the methods you will call 222
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
