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

    
    func configureCell(with event: Event) {
        
        matchDate.text = event.dateEvent
        matchTime.text = event.strTime
        strEvent.text = event.strEvent

    }
    
    
}
