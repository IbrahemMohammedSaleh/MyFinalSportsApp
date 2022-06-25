//
//  LatestPresenter.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 23/06/2022.
//

import Foundation

class LatestPresenter: ILatestPresenter {
    func onSuccess(events: EventsList) {
        iLatestView.renderLatestView(events: events)
    }

    let iLatestView: ILatestView
    
    init(iLatestView: ILatestView) {
        self.iLatestView = iLatestView
    }
    
    func fetchData() {
    
        let latestModel = LatestModelController(iLatestPresenter: self)
        latestModel.fetchDataFromApi()
    }
    
    func onFail(error: Error) {
        iLatestView.postLatestView(error: error)
    }
    
    
    
    
}
