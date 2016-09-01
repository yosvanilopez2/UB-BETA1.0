//
//  ViewController.swift
//  UB-BETA1.0
//
//  Created by Yosvani Lopez on 8/29/16.
//  Copyright © 2016 Yosvani Lopez. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
class ViewController: UIViewController {
    // change lbl to field in the name eventually
    @IBOutlet weak var emailLbl: UITextField!
    @IBOutlet weak var passwordLbl: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FIRDatabase.database().persistenceEnabled = true
        if UserDefaults.standard.value(forKey: KEY_UID) != nil {
            performSegue(withIdentifier: SEGUE_LOGIN, sender: nil)
        }
    }
    
    // attempt is added because login and signups are not for sure
    @IBAction func attemptSignIn(sender: UIButton) {
        if let email = emailLbl.text, email != "", let pwd = passwordLbl.text, pwd != "" {
            FIRAuth.auth()!.signIn(withEmail: email, password: pwd, completion: { user, error in
                if error != nil {
                    showErrorAlert(title: "User Does Not Exist", msg: "please enter a valid email and password", currentView: self)
                } else {
                    // get rid of this line later on possibly make logging in automated 
                    print ("Signed in with uid:", user?.uid)
                    self.performSegue(withIdentifier: SEGUE_LOGIN, sender: nil)
                }
            })
        } else {
            showErrorAlert(title: "Invalid Password or Email", msg: "The email or password entered is invalid", currentView: self)
        }
    }
    @IBAction func attemptSignUp(sender: UIButton) {
        self.performSegue(withIdentifier: "AccessRequest", sender: nil)
    }
 
}

