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
     //   mainViewCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        let mainPresenter: IMainPresenter = MainPresenter(iMainView: self) // 1
        mainPresenter.fetchData(endPoint: "all_sports.php")
        
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
    
    



extension MainViewController: UICollectionViewDelegateFlowLayout  {

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
