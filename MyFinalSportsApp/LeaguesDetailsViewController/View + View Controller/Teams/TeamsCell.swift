//
//  TeamsCell.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 23/06/2022.
//

import UIKit

class TeamsCell: UICollectionViewCell {
    
    @IBOutlet weak var teamsImage: UIImageView!
    
    func configureCell(with team: Team) {
//        labelLeagueViewCell.text = country.strLeague
        
        let urlImag = NSURL(string: (team.strTeamBadge ?? ""))
            let imagedata = NSData.init(contentsOf: urlImag! as URL)
        if imagedata != nil {
        
            teamsImage.image = UIImage(data: imagedata! as Data)

            teamsImage.layer.borderWidth = 1
            teamsImage.layer.masksToBounds = false
            
            teamsImage.layer.cornerRadius = teamsImage.frame.height/2.1 //This will change with corners of image and height/2 will make this circle shape
            teamsImage.clipsToBounds = true
            
            
        }
    }
}
