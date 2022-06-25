//
//  TeamDetailsVC.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 23/06/2022.
//

import UIKit

class TeamDetailsVC: UIViewController {
   
   
    
    @IBOutlet weak var stadiumName: UILabel!
    @IBOutlet weak var youtubeLink: UIButton!
    @IBOutlet weak var twitterLink: UIButton!
    @IBOutlet weak var facebookLink: UIButton!
    @IBOutlet weak var instagramLink: UIButton!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var sportsName: UILabel!
    @IBOutlet weak var teamBadge: UIImageView!
   
    var db = DBManager.sharedInstance
    var stockTeamDetails = [Team]()
    var newTeamDetails = [Team]()
    var fetchTeamsToTeamDetails: String?
  
 
    var sportsNameTD = ""
    var teamBadgeTD = ""
    var leagueNameTD = ""
    var temaNameTD = ""
    var stadiumNameTD = ""
  /*
    var instagramLinkTD = ""
    var facebookLinkTD = ""
    var youtubeLinkTD = ""
    var twitterLinkTD = ""
   */
    override func viewWillAppear(_ animated: Bool) {
        for item in stockTeamDetails {

            if item.strTeamBadge == fetchTeamsToTeamDetails {

                newTeamDetails.append(item)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       
        sportsName.text = sportsNameTD
        stadiumName.text = stadiumNameTD
      
        teamName.text = temaNameTD
        
        teamBadge.image = UIImage(named: "\(teamBadgeTD)")
        
        configureCell()

       
        }
        
    func configureCell() {
//        labelLeagueViewCell.text = country.strLeague
        
        let urlImage = NSURL(string: teamBadgeTD)
            let imageData = NSData.init(contentsOf: urlImage! as URL)
        if imageData != nil {
            teamBadge.image = UIImage(data: imageData! as Data)
        }
    
    
    
    
        //teamJersey.attributedText = NSAttributedString(
        /*struct MyStruct {
         var age: Int
         var name: String
       }
         let index = myArray.index(where: { $0.name == "Smith" })
         if let name = selection?.name {
             if let location = myArray.index(where: { $0.name == name }) {
                 // you know that location is not nil here
             }
         }
         */

       
        
//        let teamDetailsPresenter: ITeamDetailsPresenter = TeamDetailsPresenter(iTeamDetailsView: self)
//        teamDetailsPresenter.fetchData(endPoint: "search_all_teams.php?l=English%20Premier%20League")
//
        
//        let teamsPtesenter: ITeamsPresenter = TeamsPresenter(iTeamsView: self)
//        teamsPtesenter.fetchData(endPoint: "search_all_teams.php?l=English%20Premier%20League")
        
        

}

    @IBAction func backToDetailsBtnPressed(_ sender: UIBarButtonItem) {
        
        
     
        self.dismiss(animated: true, completion: nil)
    }
    
}
extension TeamDetailsVC: ITeamsView {
func renderTeamsView(teams: TeamsList) {
    newTeamDetails = teams.teams
}

func postTeamsView(error: Error) {
    print(error.localizedDescription)
}


}

    

