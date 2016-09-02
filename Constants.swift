//
//  Constants.swift
//  UB-BETA1.0
//
//  Created by Yosvani Lopez on 8/30/16.
//  Copyright © 2016 Yosvani Lopez. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

let SHADOW_COLOR: CGFloat = 157/255
let URL_BASE = "https://console.firebase.google.com/project/ub-beta1"
let KEY_UID = "uid"
// Main reference to the data base - make reference extensions from here
let DATA_BASE = FIRDatabase.database()

// access codes
// in the future move these access codes online so that they can be set unset and reset by the admin
let CA_ACCESS_CODE = "CA"
let STUDENT_ACCESS_CODE = "STUDENT"
let TEACHER_ACCESS_CODE = "TEACHER"
let ADMIN_ACCESS_CODE = "ADMIN"

func showErrorAlert(title:String, msg: String, currentView: UIViewController) {
    let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
    let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
    alert.addAction(action)
    currentView.present(alert, animated: true, completion: nil)
}

//segues

var SEGUE_LOGIN = "LoggedIn"
