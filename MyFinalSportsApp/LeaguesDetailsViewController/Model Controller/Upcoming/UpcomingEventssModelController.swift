//
//  LeagueDetailsModelController.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 22/06/2022.
//

import Foundation

class EventsModelController: IEventsModel {
   

    
    let apiServiceForEvents: ApiServiceForEvents = NetworkManager()
    let iEventsPresenter: IEventsPresenter
    
    init(iEventsPresenter: IEventsPresenter) {
        self.iEventsPresenter = iEventsPresenter
    }
    
    
    func fetchDataFromApi(endPoint: String) {
        apiServiceForEvents.fetchEventsList(endPoint: endPoint) { events, error in
            if let events = events {
                self.iEventsPresenter.onSuccess(events: events)
            }
    
        
                
           
            if let error = error {
                self.iEventsPresenter.onFail(error: error)
            }
        }
    }
    
    //Calling data from network and passing it to presenter
    

    
}
