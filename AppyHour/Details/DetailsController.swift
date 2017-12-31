//
//  DetailsController.swift
//  AppyHour
//
//  Created by Ben Lee on 12/29/17.
//  Copyright © 2017 Ben Lee. All rights reserved.
//

import Foundation
import UIKit

class DetailsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var happyHour: HappyHour? {
        didSet {
            print("Details Controller Happy hour did set")
            print("HAPPY HOUR : ", happyHour)
        }
    }
    
    let locationImageCellId = "locationDetailsImageCell"
    let mapDetailsCellId = "mapDetailsCell"
    let locationDetailsCellId =  "locationDetailsCell"
    let reviewsTitleCellId = "reviewsTitleCell"
    let reviewCellId = "reviewCell"
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        //navigationController?.setNavigationBarHidden(true, animated: false)
        collectionView?.backgroundColor = .white
        setupViews()
    }
    
    fileprivate func setupViews() {
        collectionView?.register(LocationDetailsImageCell.self, forCellWithReuseIdentifier: locationImageCellId)
        
        collectionView?.register(MapDetailsCell.self, forCellWithReuseIdentifier: mapDetailsCellId)
        
        collectionView?.register(LocationDetailsCell.self, forCellWithReuseIdentifier: locationDetailsCellId)
        
        collectionView?.register(ReviewsTitleCell.self, forCellWithReuseIdentifier: reviewsTitleCellId)
        
        collectionView?.register(ReviewCell.self, forCellWithReuseIdentifier: reviewCellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: locationImageCellId, for: indexPath) as! LocationDetailsImageCell
            cell.happyHour = happyHour
            return cell
        } else if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mapDetailsCellId, for: indexPath) as! MapDetailsCell
            
            cell.happyHour = happyHour
            return cell
        } else if indexPath.item == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: locationDetailsCellId, for: indexPath) as! LocationDetailsCell
            
            cell.happyHour = happyHour
            return cell
        } else if indexPath.item == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reviewsTitleCellId, for: indexPath) as! ReviewsTitleCell
            return cell
        } else if indexPath.item > 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reviewCellId, for: indexPath) as! ReviewCell
            return cell
        } else {
            return UICollectionViewCell()
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            return CGSize(width: view.frame.width, height: 240)
       } else if indexPath.item == 1{
            return CGSize(width: view.frame.width, height: 125)
        } else if indexPath.item == 2 {
            
            let approximateWidthOfDetailsTextView = view.frame.width - 50 - 4
            
            let size = CGSize(width: approximateWidthOfDetailsTextView, height: 1000)
            
            let attributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17)]
            
            let happyHourDetailsText = happyHour?.happyHourDetails
            
            let estimatedFrame = NSString(string: happyHourDetailsText!).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 200)
        
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



