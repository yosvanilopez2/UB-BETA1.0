//
//  SignUpVC.swift
//  UB-BETA1.0
//
//  Created by Yosvani Lopez on 8/31/16.
//  Copyright © 2016 Yosvani Lopez. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
class SignUpVC: UIViewController {
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    var accountType: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        // currently hardcoding account type later on replace this hard code with an assignment depending on the access code
        accountType = "ADMIN"
    }
    @IBAction func cancelBtn(sender: MaterialButton) {
        dismiss(animated: true, completion: nil) 
    }

    @IBAction func attemptSignUp(sender: MaterialButton) {
        if let firstName = firstName.text, firstName != "" {
            if let lastName = lastName.text, lastName != "" {
                // later on add email address validation i.e check if proper email address and check if the email address actually exists
                if let emailAddress = emailAddress.text, emailAddress != "" {
                    if let password = password.text, password != "" {
                        if let confirmPassword = confirmPassword.text, confirmPassword != "" {
                            if password == confirmPassword {
                                    FIRAuth.auth()?.createUser(withEmail: emailAddress, password: password, completion: { (user, error) in
                                    if error != nil {
                                        // expand this to account for all possible error codes 
                                        showErrorAlert(title: "Could Not Create Account", msg: "Problem creating account", currentView: self)
                                        print(error.debugDescription)
                                        print(error)
                                    } else {
                                        let userUID = user!.uid
                                        UserDefaults.standard.setValue(userUID, forKey: KEY_UID)
                                        // possibly provide a check to see if the account type has a value
                                        let userInfo = ["First Name": firstName, "Last Name": lastName, "Email Address": emailAddress, "Account Type": self.accountType!]
                                        
                                        DataService.instance.createUser(uid: userUID, user: userInfo)
                                        // no need to error check as account exist with this email and password if this point was reached
                                        FIRAuth.auth()?.signIn(withEmail: emailAddress, password: password, completion: nil)
                                        self.performSegue(withIdentifier: SEGUE_LOGIN, sender: nil)
                                    }
                                        
                                    })
                            } else {
                                 showErrorAlert(title: "Passwords Do Not Match", msg: "password and password confirmation do no match", currentView: self)
                            }
                        } else {
                            showErrorAlert(title: "Invalid Confirmation", msg: "please enter password confirmation", currentView: self)
                        }
                    } else {
                        showErrorAlert(title: "Invalid Password", msg: "please enter a password", currentView: self)
                    }
                } else {
                    showErrorAlert(title: "Invalid Email Address", msg: "please enter an email address", currentView: self)
                }
            } else {
               showErrorAlert(title: "Invalid Last Name", msg: "please enter a last name", currentView: self)
            }
        } else {
            showErrorAlert(title: "Invalid First Name", msg: "please enter a first name", currentView: self)
        }
    }
}
