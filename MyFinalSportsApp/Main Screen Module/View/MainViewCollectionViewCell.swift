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
            
            sportImage.translatesAutoresizingMaskIntoConstraints = false
           // sportImage.contentMode = .s
            sportImage.clipsToBounds = true
            sportImage.layer.cornerRadius = 12
      
            contentView.layer.cornerRadius = 6.0
            contentView.layer.borderWidth = 1.0
         //   contentView.layer.borderColor = UIColor.clear.cgColor
            contentView.layer.masksToBounds = true
        }
    }
    
//    private func configView() {
//        self.clipsToBounds = false
//        self.backgroundColor = .systemBackground
//        self.layer.cornerRadius = 10
//        self.layer.shadowColor = UIColor.black.cgColor
//        self.layer.shadowOffset = CGSize(width: 0, height: 0.0)
//        self.layer.shadowRadius = 10
//        self.layer.shadowOpacity = 0.2
//    }
}
