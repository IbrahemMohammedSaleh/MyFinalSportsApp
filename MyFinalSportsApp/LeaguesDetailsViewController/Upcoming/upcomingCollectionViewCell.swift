//
//  CollectionViewCell2.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 21/06/2022.
//

import UIKit

//class CollectionViewCell2: UICollectionViewCell {
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//}
import UIKit

class upcomingCollectionViewCell: UICollectionViewCell{



    @IBOutlet weak var eventTime: UILabel!
    @IBOutlet weak var secondTeamLB: UILabel!
    @IBOutlet weak var firstTeamLB: UILabel!
    @IBOutlet weak var firstTeamimg: UIImageView!

    @IBOutlet weak var cellView: UIView!

    @IBOutlet weak var upcomingDate: UILabel!
    @IBOutlet weak var secondTeamImg: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellView.layer.cornerRadius = 20
        cellView.layer.masksToBounds = true

    }

    static func nib()->UINib{
        return UINib(nibName: "upcomingCollectionViewCell", bundle: nil)
    }
    func updateTeamsName(firstTeam: String, secondTeam: String) {
           firstTeamLB.text = firstTeam
           secondTeamLB.text = secondTeam
    }
    func getDate(date: String,time:String) {
        upcomingDate.text = date
        eventTime.text=time
    }
 




}
