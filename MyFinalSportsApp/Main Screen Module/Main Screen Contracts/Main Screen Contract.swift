//
//  File.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 19/06/2022.
//
//
import Foundation

protocol IMainView { // For home View
    func renderMainView(sports: SportsList)
    func postErrorMainView(error: Error)
}

protocol IMainPresenter {  // For Presenter
    func fetchData(endPoint: String)
    func onSuccess(sports: SportsList)
    func onFail(error: Error)
}

protocol IMainModel { // For Model
    func fetchDataFromApi(endPoint: String)
}
