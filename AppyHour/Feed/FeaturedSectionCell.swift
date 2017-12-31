//
//  FeedCell.swift
//  AppyHour
//
//  Created by Ben Lee on 12/24/17.
//  Copyright © 2017 Ben Lee. All rights reserved.
//

import UIKit
import Firebase

class FeaturedSectionCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var feedController: FeedController?
    
    let cellId = "featuredSectionCell"
    
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
        label.text = "Featured Happy Hours"
        label.textColor = UIColor.rgb(red: 50, green: 59, blue: 69)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        fetchHappyHours()
        
    }
    
    var happyHours = [HappyHour]()
    
    fileprivate func fetchHappyHours() {
        
        let ref = Database.database().reference().child("HappyHour")
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            
            guard let dictionaries = snapshot.value as? [String : Any] else {return}
            dictionaries.forEach({ (key, value) in
                
                guard let dictionary = value as? [String : Any] else {return}
                let imageUrl = dictionary["LocationImageUrl"] as? String
                
                let happyHour = HappyHour(dictionary: dictionary)
                self.happyHours.append(happyHour)

            })
            
            self.sectionCollectionView.reloadData()
        }) { (err) in
            print("Failed to fetch happy hour")
        }
    }
    
    func setupViews() {
        addSubview(sectionCollectionView)
        sectionCollectionView.delegate = self
        sectionCollectionView.dataSource = self
        sectionCollectionView.register(FeaturedCell.self, forCellWithReuseIdentifier: cellId)
        
        
        sectionCollectionView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 30, paddingBottom: 25, paddingRight: 0, width: 0, height: 28)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("NUMBER OF HAPPY HOURS: ", happyHours.count)
        return happyHours.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = sectionCollectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FeaturedCell
            cell.happyHour = happyHours[indexPath.item]
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        feedController?.showDetailForHappyHour(happyHour: happyHours[indexPath.item])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class FeaturedCell: UICollectionViewCell {
    
    var happyHour: HappyHour? {
        didSet {
            guard  let imageUrl = happyHour?.locationImageUrl else {return}
            locationImageView.loadImage(urlString: imageUrl)
            shadowView.updateShadow()
            
            guard let name = happyHour?.locationName else {return}
            locationNameLabel.text = name
            
            // still need to implement city code for UI
            
        }
    }
    
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
    
    
    let locationImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        //imageView.layer.borderColor = UIColor(white: 0, alpha: 0.25).cgColor
        //imageView.layer.borderWidth = 1
        
        return imageView
    }()

    
    let locationNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Purple Cafe and Wine Bar"
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
//        addSubview(shadowImageView)
//        shadowImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 125, paddingLeft: 72, paddingBottom: 0, paddingRight: 0, width: 120, height: 135)
//
//        addSubview(blurView)
//        blurView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
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










