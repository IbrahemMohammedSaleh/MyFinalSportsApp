//
//  LeagueDetailsPresenter.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 22/06/2022.
//

import Foundation
class EventsPresenter: IEventsPresenter {
    func onSuccess(events: EventsList) {
        iEventsView.renderEventsView(events: events)
    }
    
    
    let iEventsView: IEventsView
    
    init(iEventsView: IEventsView) {
        self.iEventsView = iEventsView
    }
    
    func fetchData() {
  
        let eventModel = EventsModelController(iEventsPresenter: self)
        eventModel.fetchDataFromApi()
    }
    
    func onFail(error: Error) {
        iEventsView.postEventsView(error: error)
    }
  
}
