//
//  LastestCollectionViewCell.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 23/06/2022.
//

import UIKit

class LastestCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var matchTime: UILabel!
    
    @IBOutlet weak var awayTeam: UILabel!
    @IBOutlet weak var matchResult: UILabel!
    @IBOutlet weak var matchDate: UILabel!
    @IBOutlet weak var homeTeam: UILabel!
    @IBOutlet weak var latestEventImage: UIImageView!
    
    func configureCell(with latest : Event) {

        matchTime.text = latest.strTime
      
        awayTeam.text = latest.strAwayTeam
        homeTeam.text = latest.strHomeTeam
        matchDate.text = latest.dateEvent
    
        
        matchResult.text = ( "\(latest.intHomeScore) : \(latest.intAwayScore)")
        
    }
}
