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
    
    func fetchData(endPoint: String) {
        // telling him that iam respobsible of implementing the methods you will call 222
       

        let latestModel = LatestModelController(iLatestPresenter: self)
        latestModel.fetchDataFromApi(endPoint: endPoint)
    }
    
    func onFail(error: Error) {
        iLatestView.postLatestView(error: error)
    }
    
    
    
    
}
