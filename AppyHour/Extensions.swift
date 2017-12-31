//
//  Extensions.swift
//  AHour
//
//  Created by Ben Lee on 12/19/17.
//  Copyright © 2017 Ben Lee. All rights reserved.
//

import Foundation
import UIKit
import Firebase

//extension Database {
//    static func fetchHappyHour(id: String, completion: @escaping (HappyHour) -> ()) {
//        print("Fetching HappyHour with id ", id)
//        Database.database().reference().child("HappyHour").child(id).observeSingleEvent(of: .value, with: { (snapshot) in
//            guard let happyHourDictionary = snapshot.value as? [String: Any] else {return}
//            
//            let happyHour = User(uid: uid, dictionary: userDictionary)
//            //self.fetchPostsWithUser(user: user)
//            print("username: ", user.username)
//            
//            completion(user)
//        }) { (err) in
//            print("Failed to fetch user", err)
//        }
//    }
//}

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
}

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -1 * paddingRight).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
        
        func dropShadow() {
            
            self.layer.masksToBounds = false
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOpacity = 0.5
            self.layer.shadowOffset = CGSize(width: 1, height: 1)
            self.layer.shadowRadius = 1.5
            
            self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
            self.layer.shouldRasterize = true
            
            self.layer.rasterizationScale = UIScreen.main.scale
            
        }
}

