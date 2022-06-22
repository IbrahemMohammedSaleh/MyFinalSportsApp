//
//  LeagueDetailsPresenter.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 22/06/2022.
//

import Foundation

class LeagueDetailPresenter: ILeagueDetailsPresenter {
    
    let iLeagueDetailsView: ILeagueDetailsView
    init(iLeagueDetailsView: ILeagueDetailsView) {
        self.iLeagueDetailsView = iLeagueDetailsView
    }

    
    
    func fetchData(endPoint: String) {

        let leagueDetailsModel = LeagueDetailsModelController(iLeagueDetailsPresenter: self)
        leagueDetailsModel.fetchDataFromApi(endPoint: endPoint)
    }
    
    func onSuccess(events: EventsList) {
        iLeagueDetailsView.renderLeagueDetailsView(events: events)
    }
    
    func onFail(error: Error) {
        iLeagueDetailsView.postLeagueDetailsView(error: error)
    }
    
    
}


