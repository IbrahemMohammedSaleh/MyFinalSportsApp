//
//  LeagueDetailsTableViewCell.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 20/06/2022.
//

import UIKit

class LeaguesTableViewCell: UITableViewCell {

    @IBOutlet weak var labelLeagueViewCell: UILabel!
    @IBOutlet weak var imageLeagueViewCell: UIImageView!
    
    var url: String?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(with country: LeagueByStrSport) {
        labelLeagueViewCell.text = country.strLeague
        
        let urlImag = NSURL(string: (country.strBadge))
            let imagedata = NSData.init(contentsOf: urlImag! as URL)
        if imagedata != nil {
     
            imageLeagueViewCell.image = UIImage(data: imagedata! as Data)
            
            imageLeagueViewCell.layer.cornerRadius = 20
            imageLeagueViewCell.clipsToBounds = true
            imageLeagueViewCell.layer.masksToBounds = true
            imageLeagueViewCell.layer.cornerRadius = 20
            
        }
    }
    
    @IBAction func goToLinkBtnPressed(_ sender: UIButton) {
        
        //        print("clicked!")
        print(url!)
                if let url = URL(string: "https://" + (url ?? "www.youtube.com")) {
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

