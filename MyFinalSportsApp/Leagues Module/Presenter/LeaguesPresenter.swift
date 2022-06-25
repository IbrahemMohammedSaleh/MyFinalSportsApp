//
//  LeaguesPresenter.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 22/06/2022.
//

import Foundation

class LeaguesPresenter: ILeaguesPresenter  {
    
        let iLeaguesView: ILeaguesView
        // calling methods to render 333
    
        init(iLeaguesView: ILeaguesView) {
            self.iLeaguesView = iLeaguesView
        }
 
    func fetchData() {
   
        let leagueModel = LeaguesModelController(iLeaguesPresenter: self) // 2
        leagueModel.fetchDataFromApi()
    }
    
    func onFail(error: Error) {
        iLeaguesView.postErrorLeagueDetailsView(error: error)
    }
    
    func onSuccess(countries: AllLeagueByStrSport){
        iLeaguesView.renderLeagueDetailsView(countries: countries)
    }

}
