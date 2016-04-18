//
//  SignupVC.swift
//  BuffBurgers
//

import UIKit
import Firebase

class SignupVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var txtUsername : UITextField!
    @IBOutlet var txtPassword : UITextField!
    @IBOutlet var txtConfirmPassword : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func gotoLogin(sender : UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func signupTapped(sender : UIButton) {
        var userRef = Firebase(url: "https://buffburgers.firebaseio.com")
        
        let email = txtUsername.text!
        let password = txtPassword.text!
        let confirm_password = txtConfirmPassword.text!
        
        
        
        if email != "" && password != ""
        {
            if password == confirm_password
            {
                if email.lowercaseString.rangeOfString("@colorado.edu") != nil
                {
                    
                    DataService.dataservice.refFirebase.createUser(email, password: password, withValueCompletionBlock: { error, authData in
                        
                        if error != nil{
                            print("there was an eror")
                            print(error)

                            let alertController = UIAlertController(title: "Sign Up Failed!", message: "Account Already Exists", preferredStyle: .Alert)
                            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) -> Void in }
                            alertController.addAction(OKAction)
                            self.presentViewController(alertController, animated: true, completion: nil)
                            
                            
                        }
                            
                        else {
                            NSUserDefaults.standardUserDefaults().setValue(authData["uid"], forKey: "uid")
                            DataService.dataservice.refFirebase.authUser(email, password: password, withCompletionBlock: { error, result in
                                
                                let user = ["email": email]
                                DataService.dataservice.createUser(result.uid, user: user)//
                                self.performSegueWithIdentifier("signed_up", sender: nil)
                                
                            })
                            print("success")
                        }
                        
                        
                    })
                }
                else{
                    let alertController = UIAlertController(title: "Sign in Failed!", message: "Please Use a Colorado Email", preferredStyle: .Alert)
                    let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) -> Void in }
                    alertController.addAction(OKAction)
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
            }
            else{
                let alertController = UIAlertController(title: "Sign in Failed!", message: "Please Re-Enter Your Password", preferredStyle: .Alert)
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) -> Void in }
                alertController.addAction(OKAction)
                self.presentViewController(alertController, animated: true, completion: nil)
            }
            
        }
            
        else{
            let alertController = UIAlertController(title: "Sign in Failed!", message: "Please enter Email and Password", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) -> Void in }
            alertController.addAction(OKAction)
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
    }
    
        func textFieldShouldReturn(textField: UITextField) -> Bool {   //delegate method
            textField.resignFirstResponder()
            return true
        }


}





