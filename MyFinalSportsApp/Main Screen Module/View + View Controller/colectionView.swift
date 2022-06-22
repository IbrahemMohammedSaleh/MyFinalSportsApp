//
//  colectionView.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 21/06/2022.
//

import Foundation

import UIKit

//extension SportsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    
//    func setupCollectionView() {
//        sportsCV.dataSource = self
//        sportsCV.delegate = self
//    }
//    
//    func setupTabBarController() {
//        let backColor = UIColor(rgb: 0x012c57)
//        tabBarController?.tabBar.barTintColor = backColor
//        tabBarController?.tabBar.tintColor = UIColor.white
//    }
//    
//    func setupRefreshControl() {
//        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)]
//        refreshControl.attributedTitle = NSAttributedString(string: "Refresh", attributes: attributes)
//         refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
//        refreshControl.tintColor = .white
//        sportsCV.refreshControl = refreshControl
//    }
//    
//    @objc func refresh(_ sender: AnyObject) {
//        presenter.viewDidLoad()
//        sportsCV.reloadData()
//        refreshControl.endRefreshing()
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return presenter.getSportsCount()
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = sportsCV.dequeueReusableCell(withReuseIdentifier: "SportCVCell", for: indexPath) as! SportCVCell
//        presenter.configure(cell: cell, for: indexPath.row)
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let widthSize = (collectionView.frame.size.width - 48) / 2
//        return CGSize(width: widthSize, height: 180)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        presenter.didSelectRow(index: indexPath.row)
//    }
//    
//}
