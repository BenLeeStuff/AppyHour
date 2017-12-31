//
//  LocationDetailsCell.swift
//  AppyHour
//
//  Created by Ben Lee on 12/25/17.
//  Copyright © 2017 Ben Lee. All rights reserved.
//

import Foundation
import  UIKit

class LocationDetailsCell: UICollectionViewCell {
    
    var happyHour: HappyHour? {
        didSet {
            guard let locationDescription = happyHour?.locationDescription else {return}
            
            guard let happyHourDetails = happyHour?.happyHourDetails else {return}
            self.locationDescriptionLabel.text = locationDescription
            self.happyHourDetailsTextView.text = happyHourDetails
        }
    }
    
    let locationDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = UIColor.rgb(red: 50, green: 59, blue: 69)
        label.numberOfLines = 0
        return label
    }()
    
    let happyHourTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = UIColor.rgb(red: 50, green: 59, blue: 69)
        label.text = "Happy Hour"
        return label
    }()
    
    let editHappyHourButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(UIColor.rgb(red: 243, green: 70, blue: 91), for: .normal)
        button.setTitle("Edit Happy Hour", for: .normal)
        return button
    }()
    
    let happyHourDetailsTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.isUserInteractionEnabled = false
        textView.font = UIFont.systemFont(ofSize: 17)
        textView.textColor = UIColor.rgb(red: 50, green: 59, blue: 69)
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    fileprivate func setupViews() {
        
        addSubview(locationDescriptionLabel)
        locationDescriptionLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 25, paddingLeft: 24, paddingBottom: 0, paddingRight: 25, width: 0, height: 0)
        
        addSubview(editHappyHourButton)
        editHappyHourButton.anchor(top: locationDescriptionLabel.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 25, paddingLeft: 0, paddingBottom: 0, paddingRight: 25, width: 120, height: 36)
        
        addSubview(happyHourTitleLabel)
        happyHourTitleLabel.anchor(top: locationDescriptionLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: editHappyHourButton.leftAnchor, paddingTop: 25, paddingLeft: 25, paddingBottom: 0, paddingRight: 25, width: 0, height: 36)
        
        addSubview(happyHourDetailsTextView)
        happyHourDetailsTextView.anchor(top: happyHourTitleLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 15, paddingLeft: 25, paddingBottom: -20, paddingRight: 25, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
