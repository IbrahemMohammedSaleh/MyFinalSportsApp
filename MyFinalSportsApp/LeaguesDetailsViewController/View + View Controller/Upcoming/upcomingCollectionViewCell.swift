//
//  upcomingCollectionViewCell.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 23/06/2022.
//

import UIKit

class upcomingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var strEvent: UILabel!
    @IBOutlet weak var matchTime: UILabel!
    @IBOutlet weak var upcomingEventImage: UIImageView!
    @IBOutlet weak var matchDate: UILabel!
    
//    
//    cell.matchDate.text = newUpcomingArray[indexPath.row].dateEvent
//    cell.matchTime.text = newUpcomingArray[indexPath.row].strTime
//    cell.strEvent.text = newUpcomingArray[indexPath.row].strEvent
//    cell.upcomingEventImage.image = UIImage(named: "default.png")
//    cell.upcomingEventImage.layer.cornerRadius = 5
    
    
    func configureCell(with event: Event) {
        
        matchDate.text = event.dateEvent
        matchTime.text = event.strTime
        strEvent.text = event.strEvent
        upcomingEventImage.image = UIImage(named: "Untitled-1-01.png")
        upcomingEventImage.layer.cornerRadius = 5
        
//        let urlImag = NSURL(string: (event. ?? ""))
//            let imagedata = NSData.init(contentsOf: urlImag! as URL)
//        if imagedata != nil {
//
//            teamsImage.image = UIImage(data: imagedata! as Data)
//
////            teamsImage.layer.cornerRadius = 20
////            teamsImage.clipsToBounds = true
////            teamsImage.layer.masksToBounds = true
////            teamsImage.layer.cornerRadius = 20
////
//            teamsImage.layer.borderWidth = 1
//            teamsImage.layer.masksToBounds = false
//
//            teamsImage.layer.cornerRadius = teamsImage.frame.height/2 //This will change with corners of image and height/2 will make this circle shape
//            teamsImage.clipsToBounds = true
//
//
//        }
    }
    
    
}
