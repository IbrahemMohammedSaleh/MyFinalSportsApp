//
//  LeaguesDetailsVC.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 21/06/2022.
//

import UIKit


class LeaguesDetailsVC: UIViewController {
 
    var fetchTeamsToLeagueDetails: String?
    var selectedLeague: Event?
    @IBOutlet weak var favouriteBtnOutlet: UIBarButtonItem!
    @IBOutlet weak var teamsCollectionView: UICollectionView!
    @IBOutlet weak var latestResultsCollectionView: UICollectionView!
    @IBOutlet weak var upcomingCollectionView: UICollectionView!
    @IBOutlet weak var screenTitle: UINavigationItem!
  
    var stockTeamsArray = [Team]()
    var newTeamArray = [Team]()
    
    var stockUpcomingArray = [Event]()
    var newUpcomingArray = [Event]()
    
    var stockLatestArray = [Event]()
    var newLatestArray = [Event]()
    
    var titleD = ""
    var teams = [Team]()
    
    var isClicked: Bool = false
    
    
    var leagueIdFav: String = ""
    var strLeagueFav: String = ""
    var sportNameFav: String = ""
    var leagueBadgeFav: String = ""
    var strYoutubeFav: String = ""
    
    var db = DBManager.sharedInstance
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewWillAppear(_ animated: Bool) {
        for item in stockTeamsArray {

            if item.strLeague == fetchTeamsToLeagueDetails {
                
                newTeamArray.append(item)
            }
        }
        for item2 in stockUpcomingArray {

            if item2.strLeague == fetchTeamsToLeagueDetails {
                
                newUpcomingArray.append(item2)
            }
        }
        for item3 in stockLatestArray {

            if item3.strLeague == fetchTeamsToLeagueDetails {
                
                newLatestArray.append(item3)
            }
        }
        
        
     

    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        screenTitle.title = titleD
        
        

        upcomingCollectionView.dataSource = self
        upcomingCollectionView.delegate  = self

        latestResultsCollectionView.dataSource = self
        latestResultsCollectionView.delegate  = self

        teamsCollectionView.dataSource = self
        teamsCollectionView.delegate  = self

     

//MARK: - Presenters
        
        let teamsPresenter: ITeamsPresenter = TeamsPresenter(iTeamsView: self)
        teamsPresenter.fetchData()
        
        let eventsPresenter: IEventsPresenter = EventsPresenter(iEventsView: self)
        eventsPresenter.fetchData()
        
        let latestPresenter: ILatestPresenter = LatestPresenter(iLatestView: self)
        latestPresenter.fetchData()
        
        
    }
    @IBAction func goBackToLeagues(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addToFavBtnPressed(_ sender: UIBarButtonItem) {
       
        if(isClicked == false){
            self.favouriteBtnOutlet.tintColor = UIColor.red
            
      
            db.add(appDelegate: appDelegate, idLeague: "", strLeague: strLeagueFav, strSport: "", strBadge: leagueBadgeFav, strYoutube: strYoutubeFav)
   
            isClicked = true
        }
        else{
            let alert = UIAlertController(title: "Removing Alert", message: "Remove \"\(selectedLeague?.strLeague ?? "empty")\" from favourite leagues list?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                self.favouriteBtnOutlet.tintColor = UIColor.systemBlue
               // self.favouriteBtnOutlet?.deleteFavLeague(fav: self.selectedLeague!)
                self.isClicked = false
                
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
//MARK: - Rendering  Collections


extension LeaguesDetailsVC: ITeamsView {

    
//MARK: - Rendering Teams Collection
    
func renderTeamsView(teams: TeamsList) {
    newTeamArray = teams.teams
    DispatchQueue.main.async {
        self.teamsCollectionView.reloadData()
    }
}

func postTeamsView(error: Error) {
    print(error.localizedDescription)
}


}

//MARK: - Rendering Upcoming Collection

extension LeaguesDetailsVC: IEventsView {


    func renderEventsView(events: EventsList) {
        newUpcomingArray = events.events
        DispatchQueue.main.async {
            self.upcomingCollectionView.reloadData()
        }
    }
    func postEventsView(error: Error) {
        print(error.localizedDescription)
    }

}
//MARK: - Rendering Latest Collection
extension LeaguesDetailsVC: ILatestView {


   
    func renderLatestView(events: EventsList) {
        newLatestArray = events.events
        DispatchQueue.main.async {
            self.latestResultsCollectionView.reloadData()
        }
    }

    func postLatestView(error: Error) {
        print(error.localizedDescription)
    }
}


//MARK: - Extension For configure Collections

extension LeaguesDetailsVC : UICollectionViewDataSource,UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
        var numberOfItems = 0

        if collectionView == latestResultsCollectionView {
            numberOfItems = newLatestArray
                .count
        }
        else if collectionView == upcomingCollectionView {
            numberOfItems = newUpcomingArray.count
        }
        else if  collectionView == teamsCollectionView {
            numberOfItems = newTeamArray.count
        }

        return numberOfItems
    }
    
    
    //MARK: - Cell For row for Upcoming Collection
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
  
        if (collectionView == upcomingCollectionView)
        {
        
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upcomingCollectionViewCell", for: indexPath) as! upcomingCollectionViewCell
            

            cell.configureCell(with: newUpcomingArray[indexPath.row])
            
            return cell
            }
            
        //MARK: - Cell For row for Latest Collection
        
        else if (collectionView == latestResultsCollectionView)
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LastestCollectionViewCell", for: indexPath) as!  LastestCollectionViewCell
            

           cell.configureCell(with: newLatestArray[indexPath.row])
           

            return cell

        }
        
        //MARK: - Cell For row for Teams Collection
        
        else if(collectionView == teamsCollectionView) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamsCell", for: indexPath)  as! TeamsCell
    
            cell.configureCell(with: newTeamArray[indexPath.row])

            return cell

        }

        return UICollectionViewCell()
    }
    
    
    //MARK: - Did select row for Teams Collection
    
    
      func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          
          if(collectionView == teamsCollectionView) {
          let teamScreen = self.storyboard?.instantiateViewController(withIdentifier: "TeamDetailsVC") as! TeamDetailsVC
             
              teamScreen.stadiumNameTD = newTeamArray[indexPath.row].strStadium ?? ""
              teamScreen.sportsNameTD = newTeamArray[indexPath.row].strSport 
              teamScreen.leagueNameTD = newTeamArray[indexPath.row].strLeague
              teamScreen.temaNameTD = newTeamArray[indexPath.row].strTeam 
              teamScreen.teamBadgeTD = newTeamArray[indexPath.row].strTeamBadge
              teamScreen.sportsNameTD = newTeamArray[indexPath.row].strSport
              teamScreen.fetchTeamsToTeamDetails = newTeamArray[indexPath.row].strTeamBadge

              teamScreen.modalPresentationStyle = .fullScreen
              self.present(teamScreen, animated: true, completion: nil)
           
          
 
    }

      }


//}



}

