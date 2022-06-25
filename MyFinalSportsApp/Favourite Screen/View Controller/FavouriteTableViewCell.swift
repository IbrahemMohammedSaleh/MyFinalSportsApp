//
//  FavouriteTableViewCell.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 23/06/2022.
//

import UIKit
import Network

class FavouriteTableViewCell: UITableViewCell {

    @IBOutlet weak var favLabelCell: UILabel!
    @IBOutlet weak var favCellImage: UIImageView!
    
    var youtubeFavUrl = ""
//    var teamBadgeFav = "strBadge"
//    var leagueNamefFav = "strLeague"
//
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configureFavouriteCellWithoutNetwork(with country: FavouriteLeagueTable) {
        favLabelCell.text = country.strLeague
        youtubeFavUrl = country.strYoutube!
        let urlImag = NSURL(string: (country.strBadge!))
            let imagedata = NSData.init(contentsOf: urlImag! as URL)
        if imagedata != nil {

            favCellImage.image = UIImage(data: imagedata! as Data)

            favCellImage.layer.cornerRadius = 20
            favCellImage.clipsToBounds = true
            favCellImage.layer.masksToBounds = true
            favCellImage.layer.cornerRadius = 20

        }
        
//        func configureCell(with team: Team) {
//    //        labelLeagueViewCell.text = country.strLeague
//
//            let urlImag = NSURL(string: (team.strTeamBadge ?? ""))
//                let imagedata = NSData.init(contentsOf: urlImag! as URL)
//            if imagedata != nil {
//
//                teamsImage.image = UIImage(data: imagedata! as Data)
//
//                teamsImage.layer.borderWidth = 1
//                teamsImage.layer.masksToBounds = false
//
//                teamsImage.layer.cornerRadius = teamsImage.frame.height/2.1 //This will change with corners of image and height/2 will make this circle shape
//                teamsImage.clipsToBounds = true
//
//
//            }
//        }
//
//
        
        
    }
    func configureFavouriteCellWithNetwork(with country: FavouriteLeagueTable) {
        favLabelCell.text = country.strLeague
       
        youtubeFavUrl = country.strYoutube!
//        let urlImag = NSURL(string: (country.strBadge!))
//            let imagedata = NSData.init(contentsOf: urlImag! as URL)
//        if imagedata != nil {
//
//            favCellImage.image = UIImage(data: imagedata! as Data)
//
//            favCellImage.layer.cornerRadius = 20
//            favCellImage.clipsToBounds = true
//            favCellImage.layer.masksToBounds = true
//            favCellImage.layer.cornerRadius = 20
//
//        }
    }
    
    

    @IBAction func clearBtnPressed(_ sender: UIBarButtonItem) {
    }
    @IBAction func goToLinkBtn(_ sender: UIButton) {
        
        
        
        //        print("clicked!")
        print(youtubeFavUrl)
                if let url = URL(string: "https://" + (youtubeFavUrl ?? "www.youtube.com")) {
                UIApplication.shared.open(url, completionHandler: { success in
                    if success {
                        print("opened")
                    } else {
                        print("failed")
                        // showInvalidUrlAlert()
                    }
                })
                }
            }
                
        }
       

        
    
