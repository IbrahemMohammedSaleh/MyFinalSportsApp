//
//  new.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 23/06/2022.
//

//import Foundation
//import UIKit
//import CoreData
//class LeagueDetailsPresenter{
//    
//   // var networkService: fetchLeagues = NetworkManager()
//    weak var leagueDetailsView : LeagueDetailsProtocol!
//    
//    
//    //MARK:- CoreData
//    
//    var localAllData : fetchLocalData?
//    var deleteData : deleteLocalData?
//    var saveNewData : saveToLocalData?
//    var issavedLeguae : fetchSpecificLeague?
//    //1
//    var  appdelegate : AppDelegate
//    
//    //MARK: fetching
//    var fetchingDataFromCoreData : [NSManagedObject] = []
//    var fetchedData : [League] = []
//    var storedLeague : League?
//    
//    init(view : LeagueDetailsProtocol ,appDelegate : AppDelegate , name : String) {
//        self.leagueDetailsView = view
//        self.appdelegate = appDelegate
//    }
//    
//    func  getAllEvents(leagueId: String) {
//        networkService.getAllEvents(leagueId: leagueId) { [weak self]  (result, error) in
//            DispatchQueue.main.async {
//                self?.leagueDetailsView.renderEventsCollections(Events: ( result?.events) ?? [])
//            }
//        }
//    }
//
//    
//    func getTeams(leagueName: String){
//        networkService.getLeaguesTeams(strLeague: leagueName, complitionHandler:{ [weak self] (result,error) in
//            DispatchQueue.main.async {
//                self?.leagueDetailsView.renderTeamsCollection(teams: (result?.teams) ?? [])
//            }
//        })
//    }
//    
//    func setFavLeague( fav : Legaues){
//        saveNewData = ConnectToCoreData(appDelegate: appdelegate)
//        saveNewData?.setFavLeague(fav: fav)
//    }
//    
//    func deleteFavLeague( fav : Legaues){
//        // MARK: convert leagues to NSManagedObject to delete from entity
//        deleteData = ConnectToCoreData(appDelegate: appdelegate)
//        deleteData?.deleteLocalData(deleted: fav)
//        
//        
//    }
//    
//    func fetchFavLeague(){
//        localAllData = ConnectToCoreData(appDelegate: appdelegate)
//        fetchedData = localAllData?.fetchLocalData() as! [Legaues]
//    }
//    
//    func isSaved(league : Legaues) -> Bool{
//        issavedLeguae = ConnectToCoreData(appDelegate: appdelegate)
//        return issavedLeguae?.fetchSpecificLeague(fav: league) ?? false
//    }
//}
