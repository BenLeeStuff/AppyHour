//
//  ReviewCell.swift
//  AppyHour
//
//  Created by Ben Lee on 12/25/17.
//  Copyright © 2017 Ben Lee. All rights reserved.
//

import Foundation
import UIKit


class ReviewCell: UICollectionViewCell {
    // NEED TO ALLOW USERS FOR THIS FUNCTIONALITY, MAYBE USE GOOGLE REVIEW API??
    
    let profileImageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "face").withRenderingMode(.alwaysOriginal))
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Jane Doe"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = UIColor.rgb(red: 50, green: 59, blue: 69)
        return label
    }()
    
    let ratingIcon: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "stars").withRenderingMode(.alwaysOriginal))
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let reviewTextView: UITextView = {
        let tv = UITextView()
        tv.text = "My Boyfriend and I stopped by for happy hour. The ambiance is nice, and the selections are wonderful. Their small plates are to die for. Great price for the experience. Happy Hour here is the best!"
        tv.font = UIFont.systemFont(ofSize: 17)
        tv.textColor = UIColor.rgb(red: 50, green: 59, blue: 69)
        tv.isUserInteractionEnabled = false
        
        return tv
    }()
    
    let divider: UIView  = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 168/255, green: 182/255, blue: 200/255, alpha: 0.4)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    fileprivate func setupViews() {
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 25, paddingBottom: 0, paddingRight: 0, width: 40, height: 40)
        
        profileImageView.layer.cornerRadius = 20
        
        addSubview(usernameLabel)
        usernameLabel.anchor(top: topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 0, height: 40)
        
        addSubview(reviewTextView)

        reviewTextView.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 20, paddingLeft: 25, paddingBottom: 25, paddingRight: 25, width: 0, height: 120)
        
        addSubview(ratingIcon)
        ratingIcon.anchor(top: reviewTextView.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 25, paddingBottom: 0, paddingRight: 0, width: 125, height: 13)
        
        addSubview(divider)
        divider.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 25, paddingBottom: 0, paddingRight: 25, width: 0, height: 1)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
