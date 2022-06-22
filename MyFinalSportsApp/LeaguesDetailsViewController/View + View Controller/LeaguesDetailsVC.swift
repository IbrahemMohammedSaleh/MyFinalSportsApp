//
//  LeaguesDetailsVC.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 21/06/2022.
//

import UIKit

class LeaguesDetailsVC: UIViewController {
   
    var eventsArray = [Event]()
    
    @IBOutlet weak var teamsCollectionView: UICollectionView!
    @IBOutlet weak var latestResultsCollectionView: UICollectionView!
    @IBOutlet weak var upcomingCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "LeagueDetails"
        
        setupCollectionView()
        
        
        let leagueDetailsPresenter: ILeagueDetailsPresenter = LeagueDetailPresenter(iLeagueDetailsView: self)  // 1
        leagueDetailsPresenter.fetchData(endPoint: "all_sports.php")
        
        
        
        
//        let urlString = "https://www.thesportsdb.com/api/v1/json/2/eventsseason.php?id=5107"
//
//        if let url = URL(string: urlString) {
//            if let data = try? Data(contentsOf: url) {
//                parse(json: data)
//            }
//        }
    }
    
//    func parse(json: Data) {
//        let newdecoder2 = JSONDecoder()
//        if let jsonMovies = try? newdecoder2.decode(EventsList.self, from: json) {
//            eventsArray = jsonMovies.events
//            //eventsArray.reloadData()
//        }
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func addToFavouritesBynPressed(_ sender: UIButton) {
    }
    
}


extension LeaguesDetailsVC: ILeagueDetailsView {
    func renderLeagueDetailsView(events: EventsList) {
        eventsArray = events.events
        DispatchQueue.main.async {
            self.upcomingCollectionView.reloadData()
        }
    }
    
    func postLeagueDetailsView(error: Error) {
        print(error.localizedDescription)
               
    }
    


}


















//extension LeaguesDetailsVC: UICollectionViewDelegate {
//    
//}
//extension LeaguesDetailsVC: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 2
//        
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = latestResultsCollectionView.dequeueReusableCell(withReuseIdentifier: "LeaguesDetailsCell", for: indexPath) as! LeaguesDetailsCell
//        
//    
//        
//        
//        
//        return cell
//    }
//}
