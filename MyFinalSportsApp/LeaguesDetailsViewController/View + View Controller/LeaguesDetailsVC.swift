//
//  LeaguesDetailsVC.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 21/06/2022.
//

import UIKit


class LeaguesDetailsVC: UIViewController {
 

   
    var fetchTeamsToLeagueDetails: String?
    
    @IBOutlet weak var teamsCollectionView: UICollectionView!
    @IBOutlet weak var latestResultsCollectionView: UICollectionView!
    @IBOutlet weak var upcomingCollectionView: UICollectionView!
    
  //  var upComingEvents : [Event] = []
    //var latestEvents : [Event] = []
    var stockTeamsArray = [Team]()
    var newTeamArray = [Team]()
    
    var stockUpcomingArray = [Event]()
    var newUpcomingArray = [Event]()
    
    var stockLatestArray = [Event]()
    var newLatestArray = [Event]()
    
    
    var teams = [Team]()
    
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
    
        

        upcomingCollectionView.dataSource = self
        upcomingCollectionView.delegate  = self

        latestResultsCollectionView.dataSource = self
        latestResultsCollectionView.delegate  = self
        
        teamsCollectionView.dataSource = self
        teamsCollectionView.delegate  = self
        
     

        
        let teamsPresenter: ITeamsPresenter = TeamsPresenter(iTeamsView: self)
        teamsPresenter.fetchData(endPoint: "search_all_teams.php?l=English%20Premier%20League")
        
        let eventsPresenter: IEventsPresenter = EventsPresenter(iEventsView: self)
        eventsPresenter.fetchData(endPoint: "eventsseason.php?id=4617")
        
        let latestPresenter: ILatestPresenter = LatestPresenter(iLatestView: self)
        latestPresenter.fetchData(endPoint: "eventsseason.php?id=4617")
        
        
    }
    

}

extension LeaguesDetailsVC: ITeamsView {

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
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
  
        if (collectionView == upcomingCollectionView)
        {
        
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upcomingCollectionViewCell", for: indexPath) as! upcomingCollectionViewCell
            

            cell.configureCell(with: newUpcomingArray[indexPath.row])
            
            return cell
            }
            

        else if (collectionView == latestResultsCollectionView)
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LastestCollectionViewCell", for: indexPath) as! LastestCollectionViewCell
            
            cell.latestEventImage.image = UIImage(named:"Untitled-1-01.png")
           cell.configureCell(with: newLatestArray[indexPath.row])
           // cell.matchDate.text = "GDSFGDSFGDSGDFSG"

            return cell

        }
        else if(collectionView == teamsCollectionView) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamsCell", for: indexPath)  as! TeamsCell
            cell.teamsImage.image = UIImage(named:"default.png")

            cell.configureCell(with: newTeamArray[indexPath.row])
            
            


//
//            cell.teamsImage.layer.cornerRadius = cell.teamsImage.frame.size.width / 2
//            cell.teamsImage.layer.masksToBounds = true
//            cell.teamsImage.clipsToBounds = true
//
//            cell.teamsImage.layer.borderColor = UIColor.black.cgColor
//            cell.teamsImage.layer.borderWidth = 2

            cell.backgroundView =  UIImageView(image: UIImage(named:"whiteBackGround"))
            return cell

        }

        return UICollectionViewCell()
    }
    
      func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          
          if(collectionView == teamsCollectionView) {
          let teamScreen = self.storyboard?.instantiateViewController(withIdentifier: "TeamDetailsVC") as! TeamDetailsVC
          
              teamScreen.stadiumNameTD = newTeamArray[indexPath.row].strStadium ?? ""
              teamScreen.sportsNameTD = newTeamArray[indexPath.row].strSport 
              teamScreen.leagueNameTD = newTeamArray[indexPath.row].strLeague 
              teamScreen.temaNameTD = newTeamArray[indexPath.row].strTeam 
              teamScreen.teamBadgeTD = newTeamArray[indexPath.row].strTeamBadge
              
          teamScreen.modalPresentationStyle = .fullScreen
          self.present(teamScreen, animated: true, completion: nil)
          
          
          /*
           
           var stadiumNameTD = ""
           var teamNameTD = ""
           var sportsNameTD = ""
           */
          teamScreen.fetchTeamsToTeamDetails = newTeamArray[indexPath.row].strTeamBadge
         
            teamScreen.sportsNameTD = newTeamArray[indexPath.row].strSport
      
              
           
          
 
    }

      }


//}



}

