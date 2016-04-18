//
//  LoginVC.swift
//  SwiftLoginScreen
//
// need to add more failure/connection error alert messages
//

import UIKit
import Firebase
//var userID = ref.childByAppendingPath("\(ref.authData.uid)")
var userID : String = ""

class LoginVC: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet var txtUsername : UITextField!
    @IBOutlet var txtPassword : UITextField!
    var error_msg:NSString = ""
    var reponseError: NSError?
    var response: NSURLResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func signinTapped(sender : UIButton)
    {
        var ref = Firebase(url: "https://buffburgers.firebaseio.com")
        
        
        let email = txtUsername.text!
        //userID = email
        let password = txtPassword.text!
        
        if ( email.isEmpty == false && password.isEmpty == false)
        {
            DataService.dataservice._refFirebase.authUser(email, password: password, withCompletionBlock: {(error, authData) in
                
                
                print("success")
                
                
                if  error != nil {
                    print(error.code)
                    print("There was an error")

                    let alertController = UIAlertController(title: "Sign in Failed!", message: "Username or password Invalid", preferredStyle: .Alert)
                    let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) -> Void in }
                    alertController.addAction(OKAction)
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
                else
                {
                    print("there was no error")
                    self.performSegueWithIdentifier("logged_in", sender: nil)
                    userID = email
                }
                
            })
        }
            
        else{            
            let alertController = UIAlertController(title: "Sign in Failed!", message: "Please enter Email and Password", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "OK", style: .Cancel) { action -> Void in }
            alertController.addAction(OKAction)
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }
}
