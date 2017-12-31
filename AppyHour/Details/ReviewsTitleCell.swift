//
//  ReviewsTitleCell.swift
//  AppyHour
//
//  Created by Ben Lee on 12/25/17.
//  Copyright © 2017 Ben Lee. All rights reserved.
//

import Foundation
import UIKit

class ReviewsTitleCell: UICollectionViewCell {
    
    let reviewsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = UIColor.rgb(red: 50, green: 59, blue: 69)
        label.text = "Happy Hour Reviews"
        return label
    }()
    
    let addReviewButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(UIColor.rgb(red: 243, green: 70, blue: 91), for: .normal)
        button.setTitle("Add a Review", for: .normal)
        return button
    }()
    
    let ratingIcon: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "stars").withRenderingMode(.alwaysOriginal))
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    fileprivate func setupViews() {
        addSubview(addReviewButton)
        addReviewButton.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 25, width: 110, height: 36)
        
        addSubview(reviewsTitleLabel)
        reviewsTitleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 25, paddingBottom: 0, paddingRight: 0, width: 0, height: 36)
        
        addSubview(ratingIcon)
        ratingIcon.anchor(top: reviewsTitleLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 25, paddingBottom: 0, paddingRight: 0, width: 125, height: 13)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
