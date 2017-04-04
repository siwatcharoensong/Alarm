//
//  LogInController.swift
//  Alarm
//
//  Created by Siwat Charoensong on 3/28/2560 BE.
//  Copyright © 2560 Siwat Charoensong. All rights reserved.
//

import UIKit
import FirebaseAuth

class LogInController: UIViewController {
    
    @IBOutlet weak var userTxt:UITextField!
    @IBOutlet weak var passTxt:UITextField!
    @IBOutlet weak var signInBtn:UIButton!
    @IBOutlet weak var forgotBtn:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signInClick(_ sender: Any) {
        
        let user = userTxt.text
        let password = passTxt.text
        let checkValidateEmail = Const().validateEmail(email: userTxt.text!)
        
        if checkValidateEmail == false
        {
            Const().showAlert(title: "Validation", message: "Email Error", viewController: self)
        }
        
        FIRAuth.auth()?.signIn(withEmail: user!, password: password!, completion: { (firebaseUser, firebaseError) in
            if firebaseError != nil
            {
                Const().showAlert(title: "SignIn", message: "Username or Password is in correct", viewController: self)
            }
            else
            {
                self.navigationController?.dismiss(animated: true, completion: nil)
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    

}
