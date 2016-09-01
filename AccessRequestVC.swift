//
//  AccessRequestVC.swift
//  UB-BETA1.0
//
//  Created by Yosvani Lopez on 8/31/16.
//  Copyright © 2016 Yosvani Lopez. All rights reserved.
//

import UIKit

class AccessRequestVC: UIViewController {
    @IBOutlet weak var codeTextField: MaterialTextField!


    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func cancelBtn(_ sender: MaterialButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func continueToSignUp(_ sender: MaterialButton) {
        
        if codeTextField.text == STUDENT_ACCESS_CODE {
            performSegue(withIdentifier: "SignUp", sender: nil)
        }
        else if codeTextField.text == CA_ACCESS_CODE {
            performSegue(withIdentifier: "SignUp", sender: nil)
        }
        else if codeTextField.text == TEACHER_ACCESS_CODE {
            performSegue(withIdentifier: "SignUp", sender: nil)
        }
        else if codeTextField.text == ADMIN_ACCESS_CODE {
            performSegue(withIdentifier: "SignUp", sender: nil)
        }
        else {
            showErrorAlert(title: "Invalid Access Code", msg: "The access code entered is invalid", currentView: self)
        }
    }
  

}
