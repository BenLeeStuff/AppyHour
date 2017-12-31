//
//  LocationImageCell.swift
//  AppyHour
//
//  Created by Ben Lee on 12/25/17.
//  Copyright © 2017 Ben Lee. All rights reserved.
//

import Foundation
import UIKit


class LocationDetailsImageCell: UICollectionViewCell {
    
    var happyHour: HappyHour? {
        didSet {
            guard let imageUrl = happyHour?.locationImageUrl else {return}
            guard let name = happyHour?.locationName else {return}
            self.locationNameLabel.text = name
            self.locationImageView.loadImage(urlString: imageUrl)
        }
    }
    
    let locationImageView: CustomImageView = {
        let iv = CustomImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let overlayImageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "buttonOverlay"))
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let locationNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Orkney", size: 26)
        label.textColor = UIColor.white
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    fileprivate func setupViews() {
        addSubview(locationImageView)
        locationImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(overlayImageView)
        overlayImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(locationNameLabel)
        locationNameLabel.anchor(top: nil, left: overlayImageView.leftAnchor, bottom: overlayImageView.bottomAnchor, right: overlayImageView.rightAnchor, paddingTop: 0, paddingLeft: 25, paddingBottom: -70, paddingRight: 25, width: 0, height: 0)
    }
    
    override func layoutSubviews() {
    }
 
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
