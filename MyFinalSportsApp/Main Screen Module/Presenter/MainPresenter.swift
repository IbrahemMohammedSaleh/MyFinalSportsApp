//
//  MainPresenter.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 20/06/2022.
//

import Foundation

class MainPresenter: IMainPresenter {
    
        let iMainView: IMainView
        // calling methods to render 333
    
        init(iMainView: IMainView) {
            self.iMainView = iMainView
        }
    
    
    
    
    func fetchData(endPoint: String) {
        // telling him that iam respobsible of implementing the methods you will call 222
        let mainModel = MainModelController(iMainPresenter: self) // 2
        mainModel.fetchDataFromApi(endPoint: endPoint)
    }
    
    func onFail(error: Error) {
        iMainView.postErrorMainView(error: error)
    }
    
    func onSuccess(sports: SportsList) {
        iMainView.renderMainView(sports: sports)
    }
    
    

//    // this function get data from model so we create object from home model 111
//    func fetchData(endPoint: String) {
//
//        // telling him that iam respobsible of implementing the methods you will call 222
//        let mainModel = MainModelController(iMainPresenter: self) // 2
//        mainModel.fetchDataFromApi(endPoint: endPoint)
//    }
//
//    func onSuccess(sports: [Sport]) {
//        iMainView.renderMainView(sports: s)
//    }
//
//    func onFail(error: Error) {
//        iMainView.postErrorMainView(error: error)
//    }
//
}
