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
    
    
    func fetchData() {
        
        let mainModel = MainModelController(iMainPresenter: self) // 2
        mainModel.fetchDataFromApi()
    }
    
    func onFail(error: Error) {
        iMainView.postErrorMainView(error: error)
    }
    
    func onSuccess(sports: SportsList) {
        iMainView.renderMainView(sports: sports)
    }
    
    
}
