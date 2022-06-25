////
////  CoreDataManager.swift
////  MyFinalSportsApp
////
////  Created by Ibrahem's on 23/06/2022.
////
//
//
//
import Foundation
import CoreData

protocol DeletionDelegate{
    func deleteLeagueAtIndexPath(indexPath: IndexPath)
}

class DBManager{
    static let sharedInstance = DBManager()
    private init(){}
}

extension DBManager{
    func add(appDelegate: AppDelegate, idLeague: String, strLeague: String, strSport: String, strBadge:String, strYoutube: String){

        let manageContext = appDelegate.persistentContainer.viewContext

        if let entity = NSEntityDescription.entity(forEntityName: "FavouriteLeagueTable", in: manageContext){
            let favouriteLeague = NSManagedObject(entity: entity, insertInto: manageContext)
            favouriteLeague.setValue(idLeague, forKey: "idLeague")
            favouriteLeague.setValue(strLeague, forKey: "strLeague")
            favouriteLeague.setValue(strSport, forKey: "strSport")
            favouriteLeague.setValue(strBadge, forKey: "strBadge")
            favouriteLeague.setValue(strYoutube, forKey: "strYoutube")


            do {
                try manageContext.save()
            }catch let error as NSError {
                print("Error in saving")
                print(error.localizedDescription)
            }
        }
    }

    func fetchLeagues(appDelegate: AppDelegate) -> [FavouriteLeagueTable]{

        var fetchLeagues: [FavouriteLeagueTable] = []
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavouriteLeagueTable")


        do{
            fetchLeagues = try managedContext.fetch(fetchRequest) as! [FavouriteLeagueTable]
        }catch let error as NSError {
            print("Error in saving")
            print(error.localizedDescription)
        }

        return fetchLeagues
    }



    func delete(favouriteLeague:FavouriteLeagueTable, indexPath: IndexPath, appDelegate: AppDelegate, delegate: DeletionDelegate){


        let managedContext = appDelegate.persistentContainer.viewContext
        managedContext.delete(favouriteLeague)
        do{
            try managedContext.save()
            delegate.deleteLeagueAtIndexPath(indexPath: indexPath)
        }catch let error as NSError{
            print("Error in saving")
            print(error.localizedDescription)
        }

    }

}

