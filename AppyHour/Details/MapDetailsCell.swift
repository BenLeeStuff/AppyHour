//
//  MapDetailsCell.swift
//  AppyHour
//
//  Created by Ben Lee on 12/25/17.
//  Copyright © 2017 Ben Lee. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MapDetailsCell: UICollectionViewCell {
    var happyHour: HappyHour? {
        didSet {
            guard let address = happyHour?.address else {return}
            self.addressLabel.text = address
        }
    }
    
    let mapView: MKMapView = {
        let view = MKMapView()
        view.isUserInteractionEnabled = false
        return view
    }()
    
    let overlayImageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "mapOverlay"))
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.rgb(red: 50, green: 59, blue: 69)
        label.numberOfLines = 0
        return label
    }()
    
    let getDirectionsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "getDirections").withRenderingMode(.alwaysOriginal), for: .normal)
        button.setTitle("   Get Directions", for: .normal)
        button.setTitleColor(UIColor.rgb(red: 50, green: 59, blue: 69), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return button
    }()
    
    let callButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "call").withRenderingMode(.alwaysOriginal), for: .normal)
        button.setTitle("   Call", for: .normal)
        button.setTitleColor(UIColor.rgb(red: 50, green: 59, blue: 69), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    fileprivate func setupViews() {
        addSubview(mapView)
        mapView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(overlayImageView)
        overlayImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(addressLabel)
        addressLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 21, paddingLeft: 25, paddingBottom: 0, paddingRight: 150, width: 0, height: 45)
        
        addSubview(getDirectionsButton)
        getDirectionsButton.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 25, paddingBottom: -13, paddingRight: 0, width: 130, height: 35)
        
        addSubview(callButton)
        callButton.anchor(top: nil, left: getDirectionsButton.rightAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 50, paddingBottom: -13, paddingRight: 0, width: 70, height: 35)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
