//
//  File.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 21/06/2022.
//

import Foundation
import UIKit

extension LeaguesDetailsVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func setupCollectionView(){
        
        //MARK:-upcomingCollectionView section
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        //layout.itemSize = CGSize(width: 300, height: 210)
        upcomingCollectionView.collectionViewLayout = layout
        upcomingCollectionView.register(upcomingCollectionViewCell.nib(), forCellWithReuseIdentifier: "upcomingCollectionViewCell")
        upcomingCollectionView.delegate = self
        upcomingCollectionView.dataSource = self
        
        //MARK:-leastCollectionView section
        let secLayout = UICollectionViewFlowLayout()
        secLayout.scrollDirection = .vertical
        //secLayout.itemSize = CGSize(width: 330, height: 210)
        latestResultsCollectionView.collectionViewLayout = secLayout
        latestResultsCollectionView.register(LastestCollectionViewCell.nib(), forCellWithReuseIdentifier: "LastestCollectionViewCell")
        latestResultsCollectionView.delegate = self
        latestResultsCollectionView.dataSource = self
        //MARK:-TeamsCollectionView w= 184, h= 135
        
        let teamLayout = UICollectionViewFlowLayout()
        teamLayout.scrollDirection = .horizontal
        //secLayout.itemSize = CGSize(width: 330, height: 210)
        teamsCollectionView.collectionViewLayout = teamLayout
        teamsCollectionView.register(TeamsCollectionViewCell.nib(), forCellWithReuseIdentifier: "TeamsCollectionViewCell")
        teamsCollectionView.delegate = self
        teamsCollectionView.dataSource = self
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == upcomingCollectionView{
            print("upcoming")
       return 4
            
        }
        else if collectionView == latestResultsCollectionView{
            print("LATEST")
            return 4
        }
        else{
            
           print("Teams")
            return 4
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView == upcomingCollectionView)
        {
            let cell : upcomingCollectionViewCell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: "upcomingCollectionViewCell", for: indexPath) as! upcomingCollectionViewCell
      
            return cell
        }
        else if(collectionView == latestResultsCollectionView)
        {
            let cell : LastestCollectionViewCell = latestResultsCollectionView.dequeueReusableCell(withReuseIdentifier: "LastestCollectionViewCell", for: indexPath) as! LastestCollectionViewCell
 
            return cell
        }
        let cell : TeamsCollectionViewCell = teamsCollectionView.dequeueReusableCell(withReuseIdentifier: "TeamsCollectionViewCell", for: indexPath) as! TeamsCollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == teamsCollectionView{
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if collectionView == upcomingCollectionView{
            return CGSize(width: 300, height: 210)
        }
        else if (collectionView == teamsCollectionView)
        {
            return CGSize(width:184, height: 135)
        }
//        return CGSize(width:Int(leastCollectionView.frame.width), height: Int(leastCollectionView.frame.height))
        return CGSize(width: Int(latestResultsCollectionView.frame.width), height: 180)
        
    }
}

