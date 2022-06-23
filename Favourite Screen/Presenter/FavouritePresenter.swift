//
//  FavouritePresenter.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 23/06/2022.
//

//import Foundation
//
//
//
//class LeaguesPresenter: ILeaguesPresenter  {
//    
//        let iLeaguesView: ILeaguesView
//        // calling methods to render 333
//    
//        init(iLeaguesView: ILeaguesView) {
//            self.iLeaguesView = iLeaguesView
//        }
//    
//    
//    
//    
//    func fetchData(endPoint: String) {
//        // telling him that iam respobsible of implementing the methods you will call 222
//        let leagueModel = LeaguesModelController(iLeaguesPresenter: self) // 2
//        leagueModel.fetchDataFromApi(endPoint: endPoint)
//    }
//    
//    func onFail(error: Error) {
//        iLeaguesView.postErrorLeagueDetailsView(error: error)
//    }
//    
//    func onSuccess(countries: AllLeagueByStrSport){
//        iLeaguesView.renderLeagueDetailsView(countries: countries)
//    }
//    
//    
//
//
//}
