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

    
    // HappyHour 1 End Time

    
    //HappyHour 2 Start Time

    
    // HappyHour 2 End Time

    
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
        
        let imageFileName = NSUUID().uuidString
        let happyHourNodeName = NSUUID().uuidString
        Storage.storage().reference().child("LocationImages").child(imageFileName).putData(uploadData, metadata: nil) { (metadata, err) in
            if let err = err {
                print("Failed to save location image to Storage: ", err)
            }
            
            guard let locationImageUrl = metadata?.downloadURL()?.absoluteString else {return}
            print("Successfully uploaded image", locationImageUrl)
            
            let values = ["Name": name, "Address": address, "PhoneNumber": phoneNumber, "Hours": hours, "LocationDetails": locationDetails, "HappyHourDetails": happyHourDetails, "LocationImageUrl": locationImageUrl]
            
            ref.child("HappyHour").child(happyHourNodeName).updateChildValues(values) { (err, ref) in
                    if let err = err {
                        print("Failed to save values to database: ", err)
                    }
                    
                    print("Successfully saved values to database")
                    self.navigationController?.popViewController(animated: true)

            }
        }
    }
    
}
