//
//  FeedController.swift
//  AppyHour
//
//  Created by Ben Lee on 12/24/17.
//  Copyright © 2017 Ben Lee. All rights reserved.
//

import UIKit
import Foundation

class FeedController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var feedCollectionView: UICollectionView!
    
    let featuredCellId = "feedCell"
    let goingOnNowCellId = "goingOnNowSectionCell"
    let recommendedCellId = "recommendedSectionCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    fileprivate func setupViews() {
        feedCollectionView.delegate = self
        feedCollectionView.dataSource = self
        feedCollectionView.register(FeaturedSectionCell.self, forCellWithReuseIdentifier: featuredCellId)
        
        feedCollectionView.register(GoingOnNowSectionCell.self, forCellWithReuseIdentifier: goingOnNowCellId)
        
        feedCollectionView.register(RecommendedSectionCell.self, forCellWithReuseIdentifier: recommendedCellId)
    }

    @IBAction func addData(_ sender: Any) {
        performSegue(withIdentifier: "toAddData", sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func showDetailForHappyHour() {
        performSegue(withIdentifier: "toDetails", sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            let cell = feedCollectionView.dequeueReusableCell(withReuseIdentifier: featuredCellId, for: indexPath) as! FeaturedSectionCell
                cell.feedController = self
            return cell
        } else if indexPath.item == 1 {
            let cell = feedCollectionView.dequeueReusableCell(withReuseIdentifier: goingOnNowCellId, for: indexPath) as! GoingOnNowSectionCell
            return cell
        } else {
            let cell = feedCollectionView.dequeueReusableCell(withReuseIdentifier: recommendedCellId, for: indexPath) as! RecommendedSectionCell
            return cell
        }


    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 350)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }


}

