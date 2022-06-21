//
//  MainViewCollectionViewCell.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 20/06/2022.
//

import UIKit

class MainViewCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageContainer: UIView!
    @IBOutlet weak var sportName: UILabel!
    @IBOutlet weak var sportImage: UIImageView!
//    
//    override class func awakeFromNib() {
//        configView()
//    }
    
   
    func configureCell(with sport: Sport) {
       sportName.text = sport.strSport
        let urlImag = NSURL(string: sport.strSportThumb)
            let imagedata = NSData.init(contentsOf: urlImag! as URL)
        if imagedata != nil {
     
            sportImage.image = UIImage(data: imagedata! as Data)
            
            sportImage.layer.cornerRadius = 20
            sportImage.clipsToBounds = true
            sportImage.layer.masksToBounds = true
            imageContainer.layer.cornerRadius = 20
            
        }
    }
    
}

