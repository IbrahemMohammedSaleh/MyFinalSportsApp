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
   // var newLeaguesArray = [League]()
   // var leaguesArray = [League]()
    var index : IndexPath?
    
    var selectedRow : Int = 0
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        for item in leaguesArray {
            
            if item.strSport == fetchSportNameToLeagueVC {
                print(fetchSportNameToLeagueVC)
                newLeaguesArray.append(item)
            }
        }
      //  print(newLeaguesArray)
        print(newLeaguesArray.count)
        print(newLeaguesArray.count)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewLeagues.delegate = self
        tableViewLeagues.dataSource = self
        tableViewLeagues.register(UINib(nibName: "LeaguesTableViewCell", bundle: nil), forCellReuseIdentifier: "LeaguesTableViewCell")
        
  
        let leaguesPresenter: ILeaguesPresenter = LeaguesPresenter(iLeaguesView: self) // 1
        leaguesPresenter.fetchData(endPoint: "search_all_leagues.php?s=Soccer")
        //"all_leagues.php" END PI+OINT FOR ALL LEAGues
        self.title = "Leagues"
     

        
    }

    // MARK: - Table view data source


     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
         return newLeaguesArray.count
    }


     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewLeagues.dequeueReusableCell(withIdentifier: "LeaguesTableViewCell", for: indexPath) as! LeaguesTableViewCell

//         cell.imageLeagueViewCell.image = newLeaguesArray[indexPath.row].strBadge
//         cell.labelLeagueViewCell.text = newLeaguesArray[indexPath.row].strLeague
//         let urlImag = NSURL(string: (sport.strSportThumb))
//             let imagedata = NSData.init(contentsOf: urlImag! as URL)
//         if imagedata != nil {
//
//             sportImage.image = UIImage(data: imagedata! as Data)
//
//             sportImage.layer.cornerRadius = 20
//             sportImage.clipsToBounds = true
//             sportImage.layer.masksToBounds = true
//             imageContainer.layer.cornerRadius = 20
//
//         }
         print(newLeaguesArray[indexPath.row])
         cell.configureCell(with: newLeaguesArray[indexPath.row])
         cell.url = newLeaguesArray[indexPath.row].strYoutube

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let leagueDetails = self.storyboard?.instantiateViewController(identifier: "LeaguesDetailsVC") as! LeaguesDetailsVC
        
        
        leagueDetails.modalPresentationStyle = .fullScreen
//        leagueDetails.leagueName = newLeaguesArray[indexPath.row].strLeague
//        leagueDetails.leagueId = newLeaguesArray[indexPath.row].idLeague as! String
//        leagueDetails.selectedLeague = newLeaguesArray[indexPath.row]
//        leagueDetails.modalPresentationStyle = .overFullScreen

        leagueDetails.fetchTeamsToLeagueDetails = newLeaguesArray[indexPath.row].strLeague
        
        leagueDetails.titleD = newLeaguesArray[indexPath.row].strLeague
        
        self.present(leagueDetails, animated: true, completion: nil)
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
    
//    func renderLeagueDetailsView(leagues: AllLeagues) {
//        newLeaguesArray = leagues.leagues
//        DispatchQueue.main.async {
//            self.tableViewLeagues.reloadData()
//        }
//    }
   }
    
   
//let urlImag = NSURL(string: (team.strTeamBadge ?? ""))
//    let imagedata = NSData.init(contentsOf: urlImag! as URL)
//if imagedata != nil {
//
//    teamsImage.image = UIImage(data: imagedata! as Data)
//}
//   
 
    

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

extension LeagueTableViewController {
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        let detailsVC = segue.destination as! LeaguesDetailsVC
//
//
//       // detailsVC.league = newLeaguesArray[selectedRow]
//
//
//    }
}
