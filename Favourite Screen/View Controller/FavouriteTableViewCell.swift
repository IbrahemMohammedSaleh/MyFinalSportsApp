//
//  FavouriteTableViewCell.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 23/06/2022.
//

import UIKit
import Network

class FavouriteTableViewCell: UITableViewCell {

    @IBOutlet weak var favLabelCell: UILabel!
    @IBOutlet weak var favCellImage: UIImageView!
    
    var url: String?
    
    let queue = DispatchQueue(label: "InternetConnectionMonitor")
    let monitor = NWPathMonitor()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func clearBtnPressed(_ sender: UIBarButtonItem) {
    }
    @IBAction func goToLinkBtn(_ sender: UIButton) {
        
        
        monitor.pathUpdateHandler = { pathUpdateHandler  in
            if pathUpdateHandler.status == .satisfied {
                if let url = URL(string: "https://" + (self.url ?? "www.youtube.com")) {
                UIApplication.shared.open(url, completionHandler: { success in
                    if success {
                        print("opened")
                    } else {
                        print("failed")
                        // showInvalidUrlAlert()
                    }
                })
                }
            }
                
        }
        monitor.start(queue: queue)

        
    }
}
