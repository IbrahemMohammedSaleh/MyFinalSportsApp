//
//  CollectionViewCell3.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 21/06/2022.
//

//import UIKit
//
//class CollectionViewCell3: UICollectionViewCell {
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//}
import UIKit


protocol GetTeamDataProtocol {
    func getTeam(name:String,img:String)
}

class TeamsCollectionViewCell: UICollectionViewCell{

    @IBOutlet weak var teamImg: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var cellSuperView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellSuperView.layer.cornerRadius = 20
        cellSuperView.layer.masksToBounds = true
    }

    static func nib() -> UINib
    {
        return UINib(nibName: "TeamsCollectionViewCell", bundle: nil)
    }

   
}
