//
//  LatestEventsContracts.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 23/06/2022.
//



import Foundation
protocol ILatestView {
    func renderLatestView(events: EventsList)
    func postLatestView(error: Error)
}
protocol ILatestPresenter {  // For Presenter
    func fetchData(endPoint: String)
    func onSuccess(events: EventsList)
    func onFail(error: Error)
}
protocol ILatestModel { // For Model
    func fetchDataFromApi(endPoint: String)
}
