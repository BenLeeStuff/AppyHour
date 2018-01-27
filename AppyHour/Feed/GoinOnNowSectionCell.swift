//
//  GoinOnNowCell.swift
//  AppyHour
//
//  Created by Ben Lee on 12/25/17.
//  Copyright © 2017 Ben Lee. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class GoingOnNowSectionCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    var feedController: FeedController?
    
    var happyHour: HappyHour? {
        didSet {
            print("")
        }
    }
    
    var today: String = {
        let todaysDate = Date()
        let calendar = NSCalendar(calendarIdentifier: .gregorian)
        let components = calendar?.components(.weekday, from: todaysDate)
        let weekDay = components?.weekday
        var today = ""
        
        if let dayNumber = weekDay {
            switch dayNumber {
            case 1:
                today = "Sunday"
            case 2:
                today = "Monday"
            case 3:
                today = "Tuesday"
            case 4:
                today = "Wednesday"
            case 5:
                today = "Thursday"
            case 6:
                today = "Friday"
            case 7:
                today = "Saturday"
            default:
                break
            }
        }
        return today
    }()
    
    
    var happyHours = [HappyHour]()
    var todaysHappyHourTimes = [HappyHourTime]()
    
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
        NotificationCenter.default.addObserver(forName: REFRESH_CELL_NOTIFICATION, object: nil, queue: nil) { (notification) in
            self.refreshCells()
        }
        setupViews()
        fetchHappyHours()
    }
    
    func refreshCells() {
        happyHours.removeAll()
        todaysHappyHourTimes.removeAll()
        fetchHappyHours()
        feedController?.refreshControl.endRefreshing()
    }
    
    func setupViews() {
        addSubview(sectionCollectionView)
        sectionCollectionView.delegate = self
        sectionCollectionView.dataSource = self
        sectionCollectionView.register(GoingOnNowCell.self, forCellWithReuseIdentifier: cellId)
        
        sectionCollectionView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 30, paddingBottom: 25, paddingRight: 0, width: 0, height: 28)
        
    }
    
    fileprivate func fetchHappyHours() {
        
        let ref = Database.database().reference().child("HappyHour")
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            
            guard let dictionaries = snapshot.value as? [String : Any] else {return}
            dictionaries.forEach({ (key, value) in
                
                guard let dictionary = value as? [String : Any] else {return}
                
                guard let timesDictionary = dictionary["HappyHour1Times"] as? [String: Any] else {return}
                
                guard let todaysHappyHourTimeDictionary = timesDictionary[self.today] as? [String: Any] else {return}
                
                let happyHour = HappyHour(dictionary: dictionary)
                let todaysHappyHourTime = HappyHourTime(dictionary: todaysHappyHourTimeDictionary)
                
                guard let startHour = Int(todaysHappyHourTime.startTimeHour) else {return}
                guard let startMinute = Int(todaysHappyHourTime.startTimeMinute) else {return}
                guard let endHour = Int(todaysHappyHourTime.endTimeHour) else {return}
                guard let endMinute = Int(todaysHappyHourTime.endTimeMinute) else {return}
                
                
                print("Start Hour: ", startHour, "Start Minute: ", startMinute, "End Hour: ", endHour, "End Minute: ", endMinute)
                
                // figuring out if happy hour is going on now
                let calendar = Calendar.current
                let now = Date()
                let happyHourStartTime = calendar.date(bySettingHour: startHour, minute: startMinute, second: 0, of: now)!

                let happyHourEndTime = calendar.date(bySettingHour: endHour, minute: endMinute, second: 0, of: now)!

                if now >= happyHourStartTime && now <= happyHourEndTime {
                    print("happy Hour is going on now ", happyHour.locationName)
                    self.happyHours.append(happyHour)
                    self.todaysHappyHourTimes.append(todaysHappyHourTime)
                } else {
                    print("Happy hour is not going on now ", happyHour.locationName)
                }
            })
            
            self.sectionCollectionView.reloadData()
        }) { (err) in
            print("Failed to fetch happy hour")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return happyHours.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sectionCollectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! GoingOnNowCell
        
        cell.happyHour = happyHours[indexPath.item]
        cell.todaysHappyHourTime = todaysHappyHourTimes[indexPath.item]
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
        super.init(coder: aDecoder)
    }
    
}

class GoingOnNowCell: UICollectionViewCell {
    
//    let hour: Int?
//    let minute: Int?
    
    var happyHour: HappyHour? {
        didSet {
            guard let imageUrl = happyHour?.locationImageUrl else {return}
            self.locationImageView.loadImage(urlString: imageUrl)
            guard let name = happyHour?.locationName else {return}
            self.locationNameLabel.text = name
            print("HappyHourDidSet for going on now")
            //convertHappyHourEndTime()
        }
    }
    
    var todaysHappyHourTime: HappyHourTime! {
        didSet {
            guard let endHour = Int(todaysHappyHourTime.endTimeHour) else {return}
            guard let endMinute = Int(todaysHappyHourTime.endTimeMinute) else {return}
            var am = "AM"
            var pm = "PM"
            var timeString = ""
            var hour = -01
            var minute = -1
            
            if endHour > 12 {
                hour = endHour - 12
                let hourString = String(hour)
                timeString += hourString
            } else if endHour == 0 {
                hour = 12
                let hourString = String(hour)
                timeString += hourString
            } else {
                return
            }
            
            if endMinute < 10 {
                minute = endMinute
                let minuteString = "0" + String(minute)
                if endHour < 12 {
                    timeString += ":" + minuteString + am
                } else {
                    timeString += ":" + minuteString + pm
                }
                
            } else {
                minute = endMinute
                let minuteString =  String(minute)
                if endHour < 12 {
                    timeString += ":" + minuteString + am
                } else {
                    timeString += ":" + minuteString + pm
                }
            }
            self.timeEndLabel.text = "Ends At " + timeString
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
    
    let timeEndLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Orkney Regular", size: 15)
        label.textColor = .white
        return label
    }()
    
    override func layoutSubviews() {
        setupViews()
    }
    
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
        
        addSubview(timeEndLabel)
        timeEndLabel.anchor(top: nil, left: locationImageView.leftAnchor, bottom: locationImageView.bottomAnchor, right: locationImageView.rightAnchor, paddingTop: 0, paddingLeft: 25, paddingBottom: -25, paddingRight: 25, width: 0, height: 0)
        
        
        addSubview(cityLabel)
        cityLabel.anchor(top: nil, left: locationImageView.leftAnchor, bottom: timeEndLabel.topAnchor, right: locationImageView.rightAnchor, paddingTop: 0, paddingLeft: 25, paddingBottom: -15, paddingRight: 25, width: 0, height: 0)
        
        addSubview(locationNameLabel)
        locationNameLabel.anchor(top: nil, left: locationImageView.leftAnchor, bottom: cityLabel.topAnchor, right: locationImageView.rightAnchor, paddingTop: 0, paddingLeft: 25, paddingBottom: -15, paddingRight: 25, width: 0, height: 0)
        

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

