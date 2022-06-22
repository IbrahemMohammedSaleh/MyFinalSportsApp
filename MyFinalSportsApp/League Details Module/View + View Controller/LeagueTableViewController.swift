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
    var newLeaguesArray = [League]()
    var leaguesArray = [League]()

    
    override func viewWillAppear(_ animated: Bool) {
        
        for item in leaguesArray {
            
            if item.strSport == fetchSportNameToLeagueVC {
                newLeaguesArray.append(item)
            }
        }
        print(newLeaguesArray)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewLeagues.delegate = self
        tableViewLeagues.dataSource = self
        tableViewLeagues.register(UINib(nibName: "LeaguesTableViewCell", bundle: nil), forCellReuseIdentifier: "LeaguesTableViewCell")
        
  
        let leaguesPresenter: ILeaguesPresenter = LeaguesPresenter(iLeaguesView: self) // 1
        leaguesPresenter.fetchData(endPoint: "all_leagues.php")
        
        self.title = "Leagues"
     
//        let urlString = "https://www.thesportsdb.com/api/v1/json/2/all_leagues.php"
//
//        if let url = URL(string: urlString) {
//            if let data = try? Data(contentsOf: url) {
//                parse(json: data)
//            }
//        }
        
    }
//    func parse(json: Data) {
//        let newdecoder = JSONDecoder()
//        if let jsonMovies = try? newdecoder.decode(Leagues.self, from: json) {
//           leaguesArray = jsonMovies.leagues
//            tableViewLeagues.reloadData()
//        }
//    }
    // MARK: - Table view data source

     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
         return newLeaguesArray.count
    }


     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewLeagues.dequeueReusableCell(withIdentifier: "LeaguesTableViewCell", for: indexPath) as! LeaguesTableViewCell

         
         cell.labelLeagueViewCell.text = newLeaguesArray[indexPath.row].strLeague

         


        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "LeaguesDetailsSegue", sender: self)
    }

}
extension LeagueTableViewController: ILeaguesView {
    func renderLeagueDetailsView(leagues: Leagues) {
        newLeaguesArray = leagues.leagues
        
        DispatchQueue.main.async {
            self.tableViewLeagues.reloadData()
        }
    }
    
    func postErrorLeagueDetailsView(error: Error) {
        print(error.localizedDescription)
    }
    

//    func renderMainView(sports: SportsList) {   //4
//        sportsArray = sports.sports
//
//        DispatchQueue.main.async {
//            self.mainViewCollectionView.reloadData()
//        }
//    }
//    func postErrorMainView(error: Error) {
//        print(error.localizedDescription)
//    }
}
