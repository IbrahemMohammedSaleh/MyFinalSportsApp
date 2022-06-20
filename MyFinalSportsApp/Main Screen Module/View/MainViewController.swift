//
//  ViewController.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 19/06/2022.
//

import UIKit

class MainViewController: UIViewController {
   
    

    @IBOutlet weak var mainViewCollectionView: UICollectionView! 
 

    var sportsArray = [Sport]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainViewCollectionView.dataSource = self
        mainViewCollectionView.delegate   = self
     //   mainViewCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
       
        let mainPresenter: IMainPresenter = MainPresenter(iMainView: self) // 1
        mainPresenter.fetchData(endPoint: "sports.php")
        

    }
    
  


}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sportsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mainViewCollectionView.dequeueReusableCell(withReuseIdentifier: "MainViewCollectionViewCell", for: indexPath) as! MainViewCollectionViewCell
        
        
        cell.configureCell(with: sportsArray[indexPath.row])
        

//        
//        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
//        cell.layer.shadowRadius = 1.0
//        cell.layer.shadowOpacity = 0.5
//        cell.layer.masksToBounds = false
        
        return cell
    }
}

extension MainViewController: UICollectionViewDelegate  {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
    
}


extension MainViewController: UICollectionViewDelegateFlowLayout  {

}



extension MainViewController: IMainView {

    func renderMainView(sports: SportsList) {   //4
        self.sportsArray = sports.sports
        DispatchQueue.main.async {
            self.mainViewCollectionView.reloadData()
        }
    }
    func postErrorMainView(error: Error) {
        print(error.localizedDescription)
    }
}
