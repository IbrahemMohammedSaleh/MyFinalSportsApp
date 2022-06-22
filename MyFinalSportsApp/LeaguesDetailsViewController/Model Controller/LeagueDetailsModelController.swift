//
//  LeagueDetailsModelController.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 22/06/2022.
//

import Foundation
class LeagueDetailsModelController: ILeaguesModel {
   

    
    let apiServiceForEventsList: ApiServiceForEvents = NetworkManager()
    let iLeagueDetailsPresenter: ILeagueDetailsPresenter
    
    init(iLeagueDetailsPresenter: ILeagueDetailsPresenter) {
        self.iLeagueDetailsPresenter = iLeagueDetailsPresenter
    }
    
    
    func fetchDataFromApi(endPoint: String) {
        apiServiceForEventsList.fetchEventsList(endPoint: endPoint) { events, error in
            if let events = events {
                self.iLeagueDetailsPresenter.onSuccess(events: events)
            }
            if let error = error {
                self.iLeagueDetailsPresenter.onFail(error: error)
            }
        }
    }
    
    //Calling data from network and passing it to presenter
    

    
}
