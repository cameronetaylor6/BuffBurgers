//
//  SignupConfirmVCViewController.swift
//  BuffBurgers
//
//  Created by Alex Walling on 4/25/16.
//  Copyright © 2016 CSCI 3308. All rights reserved.
//

import UIKit

class SignupConfirmVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func passwordchangedTapped(sender : UIButton)
    {
        self.performSegueWithIdentifier("passwordchanged", sender: nil)
    }
    
    @IBAction func sendagainTapped(sender : UIButton)
    {
            DataService.dataservice._refFirebase.resetPasswordForUser(userID, withCompletionBlock: { error in
            if error != nil {
                // There was an error processing the request
                let alertController = UIAlertController(title: "Password Reset Failed!", message: "No Account Exists With This Email!", preferredStyle: .Alert)
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) -> Void in }
                alertController.addAction(OKAction)
                self.presentViewController(alertController, animated: true, completion: nil)
            } else {
                // Password reset sent successfully
                let alertController = UIAlertController(title: "Password Reset Success!", message: "Check Your Email!", preferredStyle: .Alert)
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) -> Void in }
                alertController.addAction(OKAction)
                self.presentViewController(alertController, animated: true, completion: nil)
               
                
            }
        })
    }

}
