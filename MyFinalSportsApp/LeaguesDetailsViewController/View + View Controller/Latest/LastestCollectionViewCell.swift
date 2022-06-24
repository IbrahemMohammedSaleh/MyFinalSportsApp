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
//        labelLeagueViewCell.text = country.strLeague
        matchTime.text = latest.strTime
        //latestEventImage.image = UIImage(named: "Untitled-1-01.png")
        awayTeam.text = latest.strAwayTeam
        homeTeam.text = latest.strHomeTeam
       // matchResult.text = event.m
        matchDate.text = latest.dateEvent
        //(result: "\(event.homeTeamScore ?? "") : \(event.awayTeamScore ?? "")")
        
   //     matchResult.text = latest.intHomeScore + latest.intAwayScore
        
        matchResult.text = ( "\(latest.intHomeScore) : \(latest.intAwayScore)")
        
    }
}
