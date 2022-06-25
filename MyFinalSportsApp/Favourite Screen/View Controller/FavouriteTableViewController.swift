//
//  FavouriteTableViewController.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 23/06/2022.
//

import UIKit
import Network
import SDWebImage
import Reachability
import CoreData

class FavouriteTableViewController: UITableViewController {
  
    var networkCheck = NetworkCheck.sharedInstance()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var leaguesList : [FavouriteLeagueTable] = []
    var leaguesListFromData : [FavouriteLeagueTable] = []
    var fetchleagueNameToFavouriteVC = ""
    
  
    @IBOutlet var favTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

   
        favTableView.dataSource = self
        favTableView.delegate  = self


        let leaguesForFavourtiePresenter: ILeaguesForFavouritePresenter = LeaguesForFavouritePresenter(iLeaguesForFavouriteView: self)
        leaguesForFavourtiePresenter.fetchData()
   
    }
    
    override func viewWillAppear(_ animated: Bool) {
        for item in leaguesList {
            
            if item.strLeague == "fetchleagueNameToFavouriteVC" {
                print(fetchleagueNameToFavouriteVC)
                leaguesListFromData.append(item)
            }
        }
       
        leaguesListFromData = DBManager.sharedInstance.fetchLeagues(appDelegate: appDelegate)
               
              self.favTableView.reloadData()
    }

    

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 
        return leaguesListFromData.count

    }
    

 
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 0, 0)
        cell.layer.transform = transform
        UITableView.animate(withDuration: 0.8) {
            cell.alpha = 1
            cell.layer.transform = CATransform3DIdentity
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteTableViewCell", for: indexPath) as! FavouriteTableViewCell

      let leagueFromData = leaguesListFromData[indexPath.row]
   
        cell.favCellImage.sd_setImage(with: URL(string:leagueFromData.strBadge! ), placeholderImage: UIImage(named: "12.png"))
        
         cell.configureFavouriteCellWithNetwork(with: leagueFromData)


        networkCheck.addObserver(observer: self)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    

    tableView.deselectRow(at: indexPath, animated: true)
       
        
        if networkCheck.currentStatus == .satisfied {
            print("YOU ARE ONLINE")
            DispatchQueue.main.async {
                
                let toLeagueDetails = self.storyboard?.instantiateViewController(identifier: "LeaguesDetailsVC") as! LeaguesDetailsVC
                
                
                toLeagueDetails.modalPresentationStyle = .fullScreen


                toLeagueDetails.fetchTeamsToLeagueDetails = self.leaguesListFromData[indexPath.row].strLeague

                
                self.present(toLeagueDetails, animated: true, completion: nil)

            }


        }else{
            print("no internet")
            DispatchQueue.main.async {
                let alert : UIAlertController = UIAlertController(title: "ERROR", message: "Please check your internet connection", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
                self.present(alert , animated: true , completion: nil)

                }
    }
    }
}
 

extension FavouriteTableViewController: ILeaguesForFavouriteView {
    func renderLeaguesForFavouriteView(countries: AllLeagueByStrSport) {
       // leaguesList = countries.countries
        DispatchQueue.main.async {
            self.favTableView.reloadData()
        }
    }
    
    func postErrorLeaguesForFavouriteView(error: Error) {
        print(error.localizedDescription)
    }
}
// MARK: - Func check network

extension FavouriteTableViewController {
func showalert(){
    let alert = UIAlertController(title: "Alert", message: "You are Not connect to Network ", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
    self.present(alert, animated: true, completion: nil)
    
    }
}



extension FavouriteTableViewController : NetworkCheckObserver{
    func statusDidChange(status: NWPath.Status) {
        if status == .satisfied {
  
            print("\n //Do something \n")
        }else if status == .unsatisfied {
            
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell : FavouriteTableViewCell = favTableView.dequeueReusableCell(withIdentifier: "FavouriteTableViewCell", for: indexPath) as! FavouriteTableViewCell
                print("\n  //Show no network alert \n")
                cell.favLabelCell.text = "You are offline"
               
                return cell
            }
            favTableView.reloadData()
    
            
        }
    }
}
