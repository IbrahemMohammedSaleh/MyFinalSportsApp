//
//  ViewController.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 19/06/2022.
//

import UIKit

class MainViewController: UIViewController {
    
    var sportsArray = [Sport]()

    @IBOutlet weak var mainViewCollectionView: UICollectionView! 
 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainViewCollectionView.dataSource = self
        mainViewCollectionView.delegate   = self

        
        
        let mainPresenter: IMainPresenter = MainPresenter(iMainView: self) // 1
        mainPresenter.fetchData()
       
    }
    
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sportsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainViewCollectionView.dequeueReusableCell(withReuseIdentifier: "MainViewCollectionViewCell", for: indexPath) as! MainViewCollectionViewCell
        
        
        cell.configureCell(with: sportsArray[indexPath.row])
        
        
        return cell
    }
}

extension MainViewController: UICollectionViewDelegate  {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if let leaguesVC = storyboard?.instantiateViewController(withIdentifier: "LeaguesVC") as? LeagueTableViewController {
            
            leaguesVC.fetchSportNameToLeagueVC = sportsArray[indexPath.row].strSport
    
            self.navigationController?.pushViewController(leaguesVC , animated: true)
        }
      
 
        }
    
    
        
    }
//MARK: - Animation
extension MainViewController: UICollectionViewDelegateFlowLayout  {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.alpha = 0
                let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 0, 0)
                cell.layer.transform = transform
                UICollectionView.animate(withDuration: 0.8) {
                    cell.alpha = 1
                    cell.layer.transform = CATransform3DIdentity
    }

}

}

extension MainViewController: IMainView {

    func renderMainView(sports: SportsList) {   //4
        sportsArray = sports.sports
        
        DispatchQueue.main.async {
            self.mainViewCollectionView.reloadData()
        }
    }
    func postErrorMainView(error: Error) {
        print(error.localizedDescription)
    }
}
