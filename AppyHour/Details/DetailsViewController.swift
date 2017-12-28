//
//  DetailsViewController.swift
//  AppyHour
//
//  Created by Ben Lee on 12/25/17.
//  Copyright © 2017 Ben Lee. All rights reserved.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let locationImageCellId = "locationDetailsImageCell"
    let mapDetailsCellId = "mapDetailsCell"
    let locationDetailsCellId =  "locationDetailsCell"
    let reviewsTitleCellId = "reviewsTitleCell"
    let reviewCellId = "reviewCell"
    
    @IBOutlet weak var detailsCollectionView: UICollectionView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    fileprivate func setupViews() {
        detailsCollectionView.delegate = self
        detailsCollectionView.dataSource = self

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = detailsCollectionView.dequeueReusableCell(withReuseIdentifier: locationImageCellId, for: indexPath) as! LocationDetailsImageCell
            
            return cell
        } else if indexPath.item == 1 {
            let cell = detailsCollectionView.dequeueReusableCell(withReuseIdentifier: mapDetailsCellId, for: indexPath) as! MapDetailsCell
            return cell
        } else if indexPath.item == 2 {
            let cell = detailsCollectionView.dequeueReusableCell(withReuseIdentifier: locationDetailsCellId, for: indexPath) as! LocationDetailsCell
            return cell
        } else if indexPath.item == 3 {
            let cell = detailsCollectionView.dequeueReusableCell(withReuseIdentifier: reviewsTitleCellId, for: indexPath) as! ReviewsTitleCell
            
            return cell
        } else if indexPath.item > 3{
            let cell = detailsCollectionView.dequeueReusableCell(withReuseIdentifier: reviewCellId, for: indexPath) as! ReviewCell
            return cell
        } else  {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            return CGSize(width: view.frame.width, height: 240)
        } else if indexPath.item == 1{
            return CGSize(width: view.frame.width, height: 125)
        } else if indexPath.item == 2 {
            return CGSize(width: view.frame.width, height: 315)
        } else if indexPath.item == 3 {
            return CGSize(width: view.frame.width, height: 80)
        } else  if indexPath.item > 3{
            return CGSize(width: view.frame.width, height: 227)
        } else {
            return CGSize(width: 0, height: 0)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}


