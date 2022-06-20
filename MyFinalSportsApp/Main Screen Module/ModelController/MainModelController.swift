//
//  MainModelController.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 20/06/2022.
//

import Foundation

////bridge of passing data from model controller to presenter
//
class MainModelController: IMainModel {
    
    let apiService: ApiService = NetworkManager()
    let iMainPresenter: IMainPresenter
    
    init(iMainPresenter: IMainPresenter)  {
        self.iMainPresenter = iMainPresenter
    }
    
    //Calling data from network and passing it to presenter
    
    func fetchDataFromApi(endPoint: String) {    // 3
        apiService.fetchUsers(endPoint: endPoint) { sports, error in
            if let sports = sports {
                self.iMainPresenter.onSuccess(sports: sports)
            }
            if let error = error {
                self.iMainPresenter.onFail(error: error)
            }
        }
    }
    
    
}
