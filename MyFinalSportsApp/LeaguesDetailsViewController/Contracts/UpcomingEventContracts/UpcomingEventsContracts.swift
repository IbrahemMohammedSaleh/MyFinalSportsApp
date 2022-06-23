//
//  UpcomingEventsContracts.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 23/06/2022.
//

import Foundation
protocol IEventsView {
    func renderEventsView(events: EventsList)
    func postEventsView(error: Error)
}
protocol IEventsPresenter {  // For Presenter
    func fetchData(endPoint: String)
    func onSuccess(events: EventsList)
    func onFail(error: Error)
}
protocol IEventsModel { // For Model
    func fetchDataFromApi(endPoint: String)
}
