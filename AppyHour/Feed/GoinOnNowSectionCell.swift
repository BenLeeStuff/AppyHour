//
//  GoinOnNowCell.swift
//  AppyHour
//
//  Created by Ben Lee on 12/25/17.
//  Copyright © 2017 Ben Lee. All rights reserved.
//

import Foundation
import UIKit

class GoingOnNowSectionCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let cellId = "goingOnNowCell"
    
    
    let sectionCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        layout.scrollDirection = .horizontal
        
        return collectionView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Orkney Bold", size: 17)
        label.text = "Going On Now"
        label.textColor = UIColor.rgb(red: 50, green: 59, blue: 69)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        addSubview(sectionCollectionView)
        sectionCollectionView.delegate = self
        sectionCollectionView.dataSource = self
        sectionCollectionView.register(GoingOnNowCell.self, forCellWithReuseIdentifier: cellId)
        
        sectionCollectionView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 30, paddingBottom: 25, paddingRight: 0, width: 0, height: 28)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sectionCollectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! GoingOnNowCell
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 280, height: 347)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

class GoingOnNowCell: UICollectionViewCell {
    
    let shadowView: ShadowView = {
        let view = ShadowView()
        view.shadowRadius = 3
        view.shadowScale = 1
        view.shadowOffset = CGSize(width: 0, height: 7)
        view.shadowOpacity = 0.8
        return view
    }()
    
    let overlayImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "overlay"))
        imageView.layer.cornerRadius = 8
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    let locationImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "restaurant2"))
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderColor = UIColor(white: 0, alpha: 0.25).cgColor
        imageView.layer.borderWidth = 1
        
        return imageView
    }()
    
    let locationNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Joeys"
        label.numberOfLines = 0
        label.font = UIFont(name: "Orkney Regular", size: 15)
        label.textColor = .white
        return label
    }()
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Bellevue"
        label.font = UIFont(name: "Orkney Regular", size: 15)
        label.textColor = .white
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    fileprivate func setupViews() {
        backgroundColor = .white
        
        
        addSubview(shadowView)
        shadowView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 70, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: 230, height: 230)
        
        shadowView.addSubview(locationImageView)
        locationImageView.anchor(top: shadowView.topAnchor, left: shadowView.leftAnchor , bottom: shadowView.bottomAnchor, right: shadowView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        shadowView.updateShadow()
        
        addSubview(overlayImageView)
        overlayImageView.anchor(top: locationImageView.topAnchor, left: locationImageView.leftAnchor, bottom: locationImageView.bottomAnchor, right: locationImageView.rightAnchor, paddingTop: 50, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(cityLabel)
        cityLabel.anchor(top: nil, left: locationImageView.leftAnchor, bottom: locationImageView.bottomAnchor, right: locationImageView.rightAnchor, paddingTop: 0, paddingLeft: 25, paddingBottom: -25, paddingRight: 25, width: 0, height: 0)
        
        addSubview(locationNameLabel)
        locationNameLabel.anchor(top: nil, left: locationImageView.leftAnchor, bottom: cityLabel.topAnchor, right: locationImageView.rightAnchor, paddingTop: 0, paddingLeft: 25, paddingBottom: -15, paddingRight: 25, width: 0, height: 0)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

