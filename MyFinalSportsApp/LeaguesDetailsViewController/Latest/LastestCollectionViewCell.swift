//
//  CollectionViewCell.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 21/06/2022.
//

import UIKit

//class CollectionViewCell: UICollectionViewCell {
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//}
class LastestCollectionViewCell: UICollectionViewCell{
       
    
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var cellSuperView: UIView!
    @IBOutlet weak var firstTeamImg: UIImageView!
    @IBOutlet weak var secondTeamImg: UIImageView!
    @IBOutlet weak var firstTeamLB: UILabel!
    @IBOutlet weak var secondTeamLB: UILabel!
    @IBOutlet weak var scoreLB: UILabel!
    @IBOutlet weak var TimeLB: UILabel!
    
    @IBOutlet weak var eventTime: UILabel!
    
    public static let reusableCellIdentifierCell = "LastestCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellSuperView.layer.cornerRadius = 20
        cellSuperView.layer.masksToBounds = true
    }
    
    static func nib()->UINib{
        return UINib(nibName: "LastestCollectionViewCell", bundle: nil)
    }
    func updateTeamsName(fisrtTeam: String, secondTeam: String) {
        firstTeamLB.text = fisrtTeam
        secondTeamLB.text = secondTeam
    }
       
   func updateResult(result: String) {
        scoreLB.text = result
   }
    
 
    func updateDate(date: String,time:String) {
        eventDate.text = date
        eventTime.text = time
    }
}
