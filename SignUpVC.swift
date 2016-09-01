//
//  SignUpVC.swift
//  UB-BETA1.0
//
//  Created by Yosvani Lopez on 8/31/16.
//  Copyright © 2016 Yosvani Lopez. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    @IBAction func cancelBtn(sender: MaterialButton) {
        dismiss(animated: true, completion: nil) 
    }
    @IBAction func attemptSignUp(sender: MaterialButton) {
        
    }
    
}
