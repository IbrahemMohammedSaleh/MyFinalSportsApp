//
//  LeagueDetailsTableViewController.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 20/06/2022.
//

import UIKit

class LeagueDetailsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableViewLeagueDetails: UITableView!
    
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

        tableViewLeagueDetails.delegate = self
        tableViewLeagueDetails.dataSource = self
        tableViewLeagueDetails.register(UINib(nibName: "LeagueDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "LeagueDetailsTableViewCell")
        
        
        
        
        self.title = "Leagues"
     
        let urlString = "https://www.thesportsdb.com/api/v1/json/2/all_leagues.php"

        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
            }
        }
        
    }
    func parse(json: Data) {
        let newdecoder = JSONDecoder()
        if let jsonMovies = try? newdecoder.decode(Leagues.self, from: json) {
           leaguesArray = jsonMovies.leagues
            tableViewLeagueDetails.reloadData()
        }
    }
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
        let cell = tableViewLeagueDetails.dequeueReusableCell(withIdentifier: "LeagueDetailsTableViewCell", for: indexPath) as! LeagueDetailsTableViewCell

         
         cell.labelLeagueViewCell.text = newLeaguesArray[indexPath.row].strLeague

         


        return cell
    }



}
