//
//  LeagueDetailsTableViewController.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 20/06/2022.
//

import UIKit

class LeagueTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableViewLeagues: UITableView!
    

    var fetchSportNameToLeagueVC: String?
    var newLeaguesArray = [LeagueByStrSport]()
    var leaguesArray = [LeagueByStrSport]()

    override func viewWillAppear(_ animated: Bool) {
        
        for item in leaguesArray {
            
            if item.strSport == fetchSportNameToLeagueVC {
                print(fetchSportNameToLeagueVC)
                newLeaguesArray.append(item)
            }
        }
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewLeagues.delegate = self
        tableViewLeagues.dataSource = self
        tableViewLeagues.register(UINib(nibName: "LeaguesTableViewCell", bundle: nil), forCellReuseIdentifier: "LeaguesTableViewCell")
        
  
        let leaguesPresenter: ILeaguesPresenter = LeaguesPresenter(iLeaguesView: self) // 1
        leaguesPresenter.fetchData()
       
        self.title = "Leagues"
  
    }

    // MARK: - Table view data source


     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
         return newLeaguesArray.count
    }


     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewLeagues.dequeueReusableCell(withIdentifier: "LeaguesTableViewCell", for: indexPath) as! LeaguesTableViewCell

         print(newLeaguesArray[indexPath.row])
         cell.configureCell(with: newLeaguesArray[indexPath.row])
         cell.url = newLeaguesArray[indexPath.row].strYoutube

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let leagueDetails = self.storyboard?.instantiateViewController(identifier: "LeaguesDetailsVC") as! LeaguesDetailsVC
        
        
        leagueDetails.modalPresentationStyle = .fullScreen

        leagueDetails.fetchTeamsToLeagueDetails = newLeaguesArray[indexPath.row].strLeague
        
      
        leagueDetails.leagueBadgeFav = newLeaguesArray[indexPath.row].strBadge
        leagueDetails.strLeagueFav = newLeaguesArray[indexPath.row].strLeague
    
        leagueDetails.strYoutubeFav = newLeaguesArray[indexPath.row].strYoutube ?? "www.youtube.com"
        
        self.present(leagueDetails, animated: true, completion: nil)
    }
    //MARK: - Animation
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 0, 0)
        cell.layer.transform = transform
        UITableView.animate(withDuration: 0.8) {
            cell.alpha = 1
            cell.layer.transform = CATransform3DIdentity
        }
    }

}
extension LeagueTableViewController: ILeaguesView {
    func renderLeagueDetailsView(countries: AllLeagueByStrSport) {
        newLeaguesArray = countries.countries
        DispatchQueue.main.async {
            self.tableViewLeagues.reloadData()
        }
    }
    
    func postErrorLeagueDetailsView(error: Error) {
        print(error.localizedDescription)
    }
    

}
