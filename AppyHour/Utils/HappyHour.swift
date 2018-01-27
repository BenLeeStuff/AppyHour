//
//  HappyHour.swift
//  AppyHour
//
//  Created by Ben Lee on 12/28/17.
//  Copyright © 2017 Ben Lee. All rights reserved.
//

import Foundation

struct HappyHour {
    //let id: String
    let locationDescription: String
    let locationImageUrl: String
    let locationName: String
    let phoneNumber: String
    let address: String
    let happyHourDetails: String
    let hours: String
    
    init(dictionary : [String :Any]) {
        self.locationImageUrl = dictionary["LocationImageUrl"] as? String ?? ""
        self.locationName = dictionary["Name"] as? String ?? ""
        self.phoneNumber = dictionary["PhoneNumber"] as? String ?? ""
        self.address = dictionary["Address"] as? String ?? ""
        self.happyHourDetails = dictionary["HappyHourDetails"] as? String ?? "Happy Hour details are unavailable"
        self.hours = dictionary["Hours"] as? String ?? ""
        self.locationDescription = dictionary["LocationDetails"] as? String ?? ""
    }
}

struct HappyHourTime {
    let startTimeHour: String
    let startTimeMinute : String
    let endTimeHour: String
    let endTimeMinute: String
    
    init(dictionary: [String: Any]) {
        self.startTimeHour = dictionary["StartHour"] as? String ?? ""
        self.startTimeMinute = dictionary["StartMinutes"] as? String ??  ""
        self.endTimeHour = dictionary["EndHour"] as? String ?? ""
        self.endTimeMinute = dictionary["EndMinutes"] as? String ?? ""
    }
}




