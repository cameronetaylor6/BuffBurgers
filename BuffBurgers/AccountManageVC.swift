//
//  AccountManageVC.swift
//  BuffBurgers
//
//  Created by Callie Jones on 4/21/16.
//  Copyright © 2016 CSCI 3308. All rights reserved.
//

import UIKit
import Firebase

class AccountManageVC: UIViewController {
    
    @IBOutlet var tempPassword : UITextField!
    @IBOutlet var newPassword : UITextField!
    @IBOutlet var confirmPassword : UITextField!
    let ref = Firebase(url: "https://buffburgers.firebaseio.com")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func passwordchangedTapped(sender : UIButton){
        print(userID,newPassword,confirmPassword)
        
        if newPassword.text! == confirmPassword.text!
        {
            print(userID)
            ref.changePasswordForUser(userID, fromOld: tempPassword.text!, toNew: confirmPassword.text!, withCompletionBlock: {
                error in
                if error != nil
                {
                    // There was an error processing the request
                    let alertController = UIAlertController(title: "Passwor Reset Failed!", message: "This Account Does Not Exist", preferredStyle: .Alert)
                    let OKAction = UIAlertAction(title: "OK", style: .Cancel) { action -> Void in }
                    alertController.addAction(OKAction)
                    self.presentViewController(alertController, animated: true, completion: nil)
                    print("ther was an error")

                }
                else
                {
                    // Password changed successfully
                    let alertController = UIAlertController(title: "Congrats!", message: "Your Password has been reset to \(self.newPassword.text!)", preferredStyle: .Alert)
                    let OKAction = UIAlertAction(title: "OK", style: .Cancel) { action -> Void in }
                    alertController.addAction(OKAction)
                    self.presentViewController(alertController, animated: true, completion: nil)
                    print("NO error")
                    self.performSegueWithIdentifier("recent-segue", sender: nil)
                    
                }
            })
        }
        else
        {
            let alertController = UIAlertController(title: "Password Reset Failed!", message: "Reconfirm Your Password", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "OK", style: .Cancel) { action -> Void in }
            alertController.addAction(OKAction)
            self.presentViewController(alertController, animated: true, completion: nil)
            print("Error")
        }

    }
    
    @IBAction func signoutTapped(sender : UIButton){
        
        ref.unauth()
        self.performSegueWithIdentifier("login-segue", sender: nil)
        
    }
    
}
