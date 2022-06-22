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
    
    
    
    
    func fetchData(endPoint: String) {
        // telling him that iam respobsible of implementing the methods you will call 222
        let leagueModel = LeaguesModelController(iLeaguesPresenter: self) // 2
        leagueModel.fetchDataFromApi(endPoint: endPoint)
    }
    
    func onFail(error: Error) {
        iLeaguesView.postErrorLeagueDetailsView(error: error)
    }
    
    func onSuccess(leagues: Leagues) {
        iLeaguesView.renderLeagueDetailsView(leagues: leagues)
    }
    
    

//    // this function get data from model so we create object from home model 111
//    func fetchData(endPoint: String) {
//
//        // telling him that iam respobsible of implementing the methods you will call 222
//        let mainModel = MainModelController(iMainPresenter: self) // 2
//        mainModel.fetchDataFromApi(endPoint: endPoint)
//    }
//
//    func onSuccess(sports: [Sport]) {
//        iMainView.renderMainView(sports: s)
//    }
//
//    func onFail(error: Error) {
//        iMainView.postErrorMainView(error: error)
//    }
//
}
