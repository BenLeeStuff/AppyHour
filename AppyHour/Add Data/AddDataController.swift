//
//  AddDataController.swift
//  AppyHour
//
//  Created by Ben Lee on 12/26/17.
//  Copyright © 2017 Ben Lee. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class AddDataController: UIViewController,   UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let addDataCellId = "addDataCell"
    
    @IBOutlet weak var locationImageView: UIImageView!
    @IBOutlet weak var locationNameTextField: UITextField!
    @IBOutlet weak var locationPhoneNumberTextField: UITextField!
    @IBOutlet weak var locationDetailsTextView: UITextView!
    @IBOutlet weak var happyHourDetailsTextView: UITextView!
    @IBOutlet weak var locationAddressTextField: UITextField!
    @IBOutlet weak var locationHoursTextField: UITextField!
    
    //HappyHour 1 Start Time
    //Hour
    @IBOutlet weak var hr1StartHourMonday: UITextField!
    @IBOutlet weak var hr1StartHourTuesday: UITextField!
    @IBOutlet weak var hr1StartHourWednesday: UITextField!
    @IBOutlet weak var hr1StartHourThursday: UITextField!
    @IBOutlet weak var hr1StartHourFriday: UITextField!
    @IBOutlet weak var hr1StartHourSaturday: UITextField!
    @IBOutlet weak var hr1StartHourSunday: UITextField!
    
    //Minutes
    @IBOutlet weak var hr1StartMinutesMonday: UITextField!
    @IBOutlet weak var hr1StartMinutesTuesday: UITextField!
    @IBOutlet weak var hr1StartMinutesWednesday: UITextField!
    @IBOutlet weak var hr1StartMinutesThursday: UITextField!
    @IBOutlet weak var hr1StartMinutesFriday: UITextField!
    @IBOutlet weak var hr1StartMinutesSaturday: UITextField!
    @IBOutlet weak var hr1StartMinutesSunday: UITextField!
    
    //HappyHour 1 End Time
    //Hour
    @IBOutlet weak var hr1EndHourMonday: UITextField!
    @IBOutlet weak var hr1EndHourTuesday: UITextField!
    @IBOutlet weak var hr1EndHourWednesday: UITextField!
    @IBOutlet weak var hr1EndHourThursday: UITextField!
    @IBOutlet weak var hr1EndHourFriday: UITextField!
    @IBOutlet weak var hr1EndHourSaturday: UITextField!
    @IBOutlet weak var hr1EndHourSunday: UITextField!
    
    //Minutes
    @IBOutlet weak var hr1EndMinutesMonday: UITextField!
    @IBOutlet weak var hr1EndMinutesTuesday: UITextField!
    @IBOutlet weak var hr1EndMinutesWednesday: UITextField!
    @IBOutlet weak var hr1EndMinutesThursday: UITextField!
    @IBOutlet weak var hr1EndMinutesFriday: UITextField!
    @IBOutlet weak var hr1EndMinutesSaturday: UITextField!
    @IBOutlet weak var hr1EndMinutesSunday: UITextField!
    
    //HappyHour 2 Start Time
    //Hour
    @IBOutlet weak var hr2StartHourMonday: UITextField!
    @IBOutlet weak var hr2StartHourTuesday: UITextField!
    @IBOutlet weak var hr2StartHourWednesday: UITextField!
    @IBOutlet weak var hr2StartHourThursday: UITextField!
    @IBOutlet weak var hr2StartHourFriday: UITextField!
    @IBOutlet weak var hr2StartHourSaturday: UITextField!
    @IBOutlet weak var hr2StartHourSunday: UITextField!
    
    //Minutes
    @IBOutlet weak var hr2StartMinutesMonday: UITextField!
    @IBOutlet weak var hr2StartMinutesTuesday: UITextField!
    @IBOutlet weak var hr2StartMinutesWednesday: UITextField!
    @IBOutlet weak var hr2StartMinutesThursday: UITextField!
    @IBOutlet weak var hr2StartMinutesFriday: UITextField!
    @IBOutlet weak var hr2StartMinutesSaturday: UITextField!
    @IBOutlet weak var hr2StartMinutesSunday: UITextField!
    
    
    // HappyHour 2 End Time
    //Hour
    @IBOutlet weak var hr2EndHourMonday: UITextField!
    @IBOutlet weak var hr2EndHourTuesday: UITextField!
    @IBOutlet weak var hr2EndHourWednesday: UITextField!
    @IBOutlet weak var hr2EndHourThursday: UITextField!
    @IBOutlet weak var hr2EndHourFriday: UITextField!
    @IBOutlet weak var hr2EndHourSaturday: UITextField!
    @IBOutlet weak var hr2EndHourSunday: UITextField!
    
    //Minutes
    @IBOutlet weak var hr2EndMinutesMonday: UITextField!
    @IBOutlet weak var hr2EndMinutesTuesday: UITextField!
    @IBOutlet weak var hr2EndMinutesWednesday: UITextField!
    @IBOutlet weak var hr2EndMinutesThursday: UITextField!
    @IBOutlet weak var hr2EndMinutesFriday: UITextField!
    @IBOutlet weak var hr2EndMinutesSaturday: UITextField!
    @IBOutlet weak var hr2EndMinutesSunday: UITextField!
    
    //HappyHour 3 Start Time
    //Hour
    @IBOutlet weak var hr3StartHourMonday: UITextField!
    @IBOutlet weak var hr3StartHourTuesday: UITextField!
    @IBOutlet weak var hr3StartHourWednesday: UITextField!
    @IBOutlet weak var hr3StartHourThursday: UITextField!
    @IBOutlet weak var hr3StartHourFriday: UITextField!
    @IBOutlet weak var hr3StartHourSaturday: UITextField!
    @IBOutlet weak var hr3StartHourSunday: UITextField!
    //Minutes
    @IBOutlet weak var hr3StartMinutesMonday: UITextField!
    @IBOutlet weak var hr3StartMinutesTuesday: UITextField!
    @IBOutlet weak var hr3StartMinutesWednesday: UITextField!
    @IBOutlet weak var hr3StartMinutesThursday: UITextField!
    @IBOutlet weak var hr3StartMinutesFriday: UITextField!
    @IBOutlet weak var hr3StartMinutesSaturday: UITextField!
    @IBOutlet weak var hr3StartMinutesSunday: UITextField!
    //HappyHour 3 End Time
    //Hour
    @IBOutlet weak var hr3EndHourMonday: UITextField!
    @IBOutlet weak var hr3EndHourTuesday: UITextField!
    @IBOutlet weak var hr3EndHourWednesday: UITextField!
    @IBOutlet weak var hr3EndHourThursday: UITextField!
    @IBOutlet weak var hr3EndHourFriday: UITextField!
    @IBOutlet weak var hr3EndHourSaturday: UITextField!
    @IBOutlet weak var hr3EndHourSunday: UITextField!
    //Minutes
    @IBOutlet weak var hr3EndMinutesMonday: UITextField!
    @IBOutlet weak var hr3EndMinutesTuesday: UITextField!
    @IBOutlet weak var hr3EndMinutesWednesday: UITextField!
    @IBOutlet weak var hr3EndMinutesThursday: UITextField!
    @IBOutlet weak var hr3EndMinutesFriday: UITextField!
    @IBOutlet weak var hr3EndMinutesSaturday: UITextField!
    @IBOutlet weak var hr3EndMinutesSunday: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    fileprivate func setupViews() {
        
    }
    
    @IBAction func addLocationPhoto(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        present(imagePickerController, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            locationImageView.image = editedImage
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            
            locationImageView.image = originalImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    fileprivate func submitHappyHour1Times(id: String) {
        // Happy Hour 1, Start time (HOUR)
        guard let happyHour1StartHourMonday = hr1StartHourMonday.text else {return}
        guard let happyHour1StartHourTuesday = hr1StartHourTuesday.text else {return}
        guard let happyHour1StartHourWednesday = hr1StartHourWednesday.text else {return}
        guard let happyHour1StartHourThursday = hr1StartHourThursday.text else {return}
        guard let happyHour1StartHourFriday = hr1StartHourFriday.text else {return}
        guard let happyHour1StartHourSaturday = hr1StartHourSaturday.text else {return}
        guard let happyHour1StartHourSunday = hr1StartHourSunday.text else {return}
        
        // Happy Hour 1, Start time (Minutes)
        guard let happyHour1StartMinutesMonday = hr1StartMinutesMonday.text else {return}
        guard let happyHour1StartMinutesTuesday = hr1StartMinutesTuesday.text else {return}
        guard let happyHour1StartMinutesWednesday = hr1StartMinutesWednesday.text else {return}
        guard let happyHour1StartMinutesThursday = hr1StartMinutesThursday.text else {return}
        guard let happyHour1StartMinutesFriday = hr1StartMinutesFriday.text else {return}
        guard let happyHour1StartMinutesSaturday = hr1StartMinutesSaturday.text else {return}
        guard let happyHour1StartMinutesSunday = hr1StartMinutesSunday.text else {return}
        
        //Happy Hour 1 End time (Hour)
        guard let happyHour1EndHourMonday = hr1EndHourMonday.text else {return}
        guard let happyHour1EndHourTuesday = hr1EndHourTuesday.text  else {return}
        guard let happyHour1EndHourWednesday = hr1EndHourWednesday.text  else {return}
        guard let happyHour1EndHourThursday = hr1EndHourThursday.text  else {return}
        guard let happyHour1EndHourFriday = hr1EndHourFriday.text  else {return}
        guard let happyHour1EndHourSaturday = hr1EndHourSaturday.text  else {return}
        guard let happyHour1EndHourSunday = hr1EndHourSunday.text  else {return}
        
        //Happy Hour 1 End time (Minutes)
        guard let happyHour1EndMinutesMonday = hr1EndMinutesMonday.text  else {return}
        guard let happyHour1EndMinutesTuesday = hr1EndMinutesTuesday.text  else {return}
        guard let happyHour1EndMinutesWednesday = hr1EndMinutesWednesday.text  else {return}
        guard let happyHour1EndMinutesThursday = hr1EndMinutesThursday.text  else {return}
        guard let happyHour1EndMinutesFriday = hr1EndMinutesFriday.text  else {return}
        guard let happyHour1EndMinutesSaturday = hr1EndMinutesSaturday.text  else {return}
        guard let happyHour1EndMinutesSunday = hr1EndMinutesSunday.text  else {return}
        
        let mondayValues = ["StartHour": happyHour1StartHourMonday, "StartMinutes": happyHour1StartMinutesMonday, "EndHour": happyHour1EndHourMonday, "EndMinutes":happyHour1EndMinutesMonday] as [String : Any]
        
        let tuesdayValues = ["StartHour": happyHour1StartHourTuesday, "StartMinutes": happyHour1StartMinutesTuesday, "EndHour": happyHour1EndHourTuesday, "EndMinutes":happyHour1EndMinutesTuesday] as [String : Any]
        
        let wednesdayValues = ["StartHour": happyHour1StartHourWednesday, "StartMinutes": happyHour1StartMinutesWednesday, "EndHour": happyHour1EndHourWednesday, "EndMinutes":happyHour1EndMinutesWednesday] as [String : Any]
        
        let thursdayValues = ["StartHour": happyHour1StartHourThursday, "StartMinutes": happyHour1StartMinutesThursday, "EndHour": happyHour1EndHourThursday, "EndMinutes":happyHour1EndMinutesThursday] as [String : Any]
        
        let fridayValues = ["StartHour": happyHour1StartHourFriday, "StartMinutes": happyHour1StartMinutesFriday, "EndHour": happyHour1EndHourFriday, "EndMinutes":happyHour1EndMinutesFriday] as [String : Any]
        
        let saturdayValues = ["StartHour": happyHour1StartHourSaturday, "StartMinutes": happyHour1StartMinutesSaturday, "EndHour": happyHour1EndHourSaturday, "EndMinutes":happyHour1EndMinutesSaturday] as [String : Any]
        
        let sundayValues = ["StartHour": happyHour1StartHourSunday, "StartMinutes": happyHour1StartMinutesSunday, "EndHour": happyHour1EndHourSunday, "EndMinutes":happyHour1EndMinutesSunday] as [String : Any] as [String : Any]
        
        guard let address = locationAddressTextField.text else {return}
        
        var ref: DatabaseReference!
        ref = Database.database().reference()
        ref.child("HappyHour").child(id).child("HappyHour1Times").child("Monday").updateChildValues(mondayValues)
        ref.child("HappyHour").child(id).child("HappyHour1Times").child("Tuesday").updateChildValues(tuesdayValues)
        ref.child("HappyHour").child(id).child("HappyHour1Times").child("Wednesday").updateChildValues(wednesdayValues)
        ref.child("HappyHour").child(id).child("HappyHour1Times").child("Thursday").updateChildValues(thursdayValues)
        ref.child("HappyHour").child(id).child("HappyHour1Times").child("Friday").updateChildValues(fridayValues)
        ref.child("HappyHour").child(id).child("HappyHour1Times").child("Saturday").updateChildValues(saturdayValues)
        ref.child("HappyHour").child(id).child("HappyHour1Times").child("Sunday").updateChildValues(sundayValues)
    }
    
    fileprivate func submitHappyHour2Times(id: String) {
        // Happy Hour 1, Start time (HOUR)
        guard let happyHour2StartHourMonday = hr2StartHourMonday.text else {return}
        guard let happyHour2StartHourTuesday = hr2StartHourTuesday.text else {return}
        guard let happyHour2StartHourWednesday = hr2StartHourWednesday.text else {return}
        guard let happyHour2StartHourThursday = hr2StartHourThursday.text else {return}
        guard let happyHour2StartHourFriday = hr2StartHourFriday.text else {return}
        guard let happyHour2StartHourSaturday = hr2StartHourSaturday.text else {return}
        guard let happyHour2StartHourSunday = hr2StartHourSunday.text else {return}
        
        // Happy Hour 1, Start time (Minutes)
        guard let happyHour2StartMinutesMonday = hr2StartMinutesMonday.text else {return}
        guard let happyHour2StartMinutesTuesday = hr2StartMinutesTuesday.text else {return}
        guard let happyHour2StartMinutesWednesday = hr2StartMinutesWednesday.text else {return}
        guard let happyHour2StartMinutesThursday = hr2StartMinutesThursday.text else {return}
        guard let happyHour2StartMinutesFriday = hr2StartMinutesFriday.text else {return}
        guard let happyHour2StartMinutesSaturday = hr2StartMinutesSaturday.text else {return}
        guard let happyHour2StartMinutesSunday = hr2StartMinutesSunday.text else {return}
        
        //Happy Hour 1 End time (Hour)
        guard let happyHour2EndHourMonday = hr2EndHourMonday.text else {return}
        guard let happyHour2EndHourTuesday = hr2EndHourTuesday.text  else {return}
        guard let happyHour2EndHourWednesday = hr2EndHourWednesday.text  else {return}
        guard let happyHour2EndHourThursday = hr2EndHourThursday.text  else {return}
        guard let happyHour2EndHourFriday = hr2EndHourFriday.text  else {return}
        guard let happyHour2EndHourSaturday = hr2EndHourSaturday.text  else {return}
        guard let happyHour2EndHourSunday = hr2EndHourSunday.text  else {return}
        
        //Happy Hour 1 End time (Minutes)
        guard let happyHour2EndMinutesMonday = hr2EndMinutesMonday.text  else {return}
        guard let happyHour2EndMinutesTuesday = hr2EndMinutesTuesday.text  else {return}
        guard let happyHour2EndMinutesWednesday = hr2EndMinutesWednesday.text  else {return}
        guard let happyHour2EndMinutesThursday = hr2EndMinutesThursday.text  else {return}
        guard let happyHour2EndMinutesFriday = hr2EndMinutesFriday.text  else {return}
        guard let happyHour2EndMinutesSaturday = hr2EndMinutesSaturday.text  else {return}
        guard let happyHour2EndMinutesSunday = hr2EndMinutesSunday.text  else {return}
        
        let mondayValues = ["StartHour": happyHour2StartHourMonday, "StartMinutes": happyHour2StartMinutesMonday, "EndHour": happyHour2EndHourMonday, "EndMinutes":happyHour2EndMinutesMonday] as [String : Any]
        
        let tuesdayValues = ["StartHour": happyHour2StartHourTuesday, "StartMinutes": happyHour2StartMinutesTuesday, "EndHour": happyHour2EndHourTuesday, "EndMinutes":happyHour2EndMinutesTuesday] as [String : Any]
        
        let wednesdayValues = ["StartHour": happyHour2StartHourWednesday, "StartMinutes": happyHour2StartMinutesWednesday, "EndHour": happyHour2EndHourWednesday, "EndMinutes":happyHour2EndMinutesWednesday] as [String : Any]
        
        let thursdayValues = ["StartHour": happyHour2StartHourThursday, "StartMinutes": happyHour2StartMinutesThursday, "EndHour": happyHour2EndHourThursday, "EndMinutes":happyHour2EndMinutesThursday] as [String : Any]
        
        let fridayValues = ["StartHour": happyHour2StartHourFriday, "StartMinutes": happyHour2StartMinutesFriday, "EndHour": happyHour2EndHourFriday, "EndMinutes":happyHour2EndMinutesFriday] as [String : Any]
        
        let saturdayValues = ["StartHour": happyHour2StartHourSaturday, "StartMinutes": happyHour2StartMinutesSaturday, "EndHour": happyHour2EndHourSaturday, "EndMinutes":happyHour2EndMinutesSaturday] as [String : Any]
        
        let sundayValues = ["StartHour": happyHour2StartHourSunday, "StartMinutes": happyHour2StartMinutesSunday, "EndHour": happyHour2EndHourSunday, "EndMinutes":happyHour2EndMinutesSunday] as [String : Any] as [String : Any]
        
        guard let address = locationAddressTextField.text else {return}
        
        var ref: DatabaseReference!
        ref = Database.database().reference()
        ref.child("HappyHour").child(id).child("HappyHour2Times").child("Monday").updateChildValues(mondayValues)
        ref.child("HappyHour").child(id).child("HappyHour2Times").child("Tuesday").updateChildValues(tuesdayValues)
        ref.child("HappyHour").child(id).child("HappyHour2Times").child("Wednesday").updateChildValues(wednesdayValues)
        ref.child("HappyHour").child(id).child("HappyHour2Times").child("Thursday").updateChildValues(thursdayValues)
        ref.child("HappyHour").child(id).child("HappyHour2Times").child("Friday").updateChildValues(fridayValues)
        ref.child("HappyHour").child(id).child("HappyHour2Times").child("Saturday").updateChildValues(saturdayValues)
        ref.child("HappyHour").child(id).child("HappyHour2Times").child("Sunday").updateChildValues(sundayValues)
    }

    @IBAction func submitToDatabase(_ sender: Any) {
        guard let image = locationImageView.image else {return}
        guard let name = locationNameTextField.text else {return}
        guard let phoneNumber = locationPhoneNumberTextField.text else {return}
        guard let address = locationAddressTextField.text else {return}
        guard let hours = locationHoursTextField.text else {return}
        guard let happyHourDetails = happyHourDetailsTextView.text else {return}
        guard let locationDetails = locationDetailsTextView.text else {return}
        
        guard let uploadData = UIImageJPEGRepresentation(image, 0.3) else {return}
        
        var ref: DatabaseReference!
        ref = Database.database().reference()
        
        let fileName = NSUUID().uuidString
        Storage.storage().reference().child("LocationImages").child(fileName).putData(uploadData, metadata: nil) { (metadata, err) in
            if let err = err {
                print("Failed to save location image to Storage: ", err)
            }
            
            guard let locationImageUrl = metadata?.downloadURL()?.absoluteString else {return}
            print("Successfully uploaded image", locationImageUrl)
            
            let values = ["Name": name, "Address": address, "PhoneNumber": phoneNumber, "Hours": hours, "LocationDetails": locationDetails, "HappyHourDetails": happyHourDetails, "LocationImageUrl": locationImageUrl, "LocationId": fileName]
            
            ref.child("HappyHour").child(fileName).updateChildValues(values) { (err, ref) in
                    if let err = err {
                        print("Failed to save values to database: ", err)
                    }
                    self.submitHappyHour2Times(id: fileName)
                    self.submitHappyHour1Times(id: fileName)
                    print("Successfully saved values to database")
                    self.navigationController?.popViewController(animated: true)

            }
        }
    }
    
}
