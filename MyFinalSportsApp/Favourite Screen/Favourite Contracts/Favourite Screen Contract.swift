//
//  Favourite Screen Contract.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 23/06/2022.
//

import Foundation
protocol ILeaguesForFavouriteView {
    func renderLeaguesForFavouriteView(countries: AllLeagueByStrSport)
    func postErrorLeaguesForFavouriteView(error: Error)
}

protocol ILeaguesForFavouritePresenter {
    func fetchData()
    func onSuccess(countries: AllLeagueByStrSport)
    func onFail(error: Error)
}

protocol ILeaguesForFavouriteModel { 
    func fetchDataFromApi()
}
