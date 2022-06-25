//
//  LatestModelController.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 23/06/2022.
//

import Foundation

class LatestModelController: ILatestModel {
   

    
    let apiServiceForLatest:ApiServiceForLatest = NetworkManager()
    let iLatestPresenter: ILatestPresenter
    
    init(iLatestPresenter: ILatestPresenter) {
        self.iLatestPresenter = iLatestPresenter
    }
    
    
    func fetchDataFromApi() {
        
//        apiServiceForLatest.fetchLatest(endPoint: endPoint) { latest, error in
//            if let latest = latest {
//                self.iLatestPresenter.onSuccess(latest: latest)
//            }
//            if let error = error {
//                self.iLatestPresenter.onFail(error: error)
//            }
//        }
        apiServiceForLatest.fetchLatest() { events, error in
            if let events = events {
                self.iLatestPresenter.onSuccess(events: events)
            }
            if let error = error {
                self.iLatestPresenter.onFail(error: error)
            }
        }

    }
    
    //Calling data from network and passing it to presenter
    

    
}
