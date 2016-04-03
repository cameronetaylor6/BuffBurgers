//
//  LoginVC.swift
//  SwiftLoginScreen
//
// need to add more failure/connection error alert messages
//

import UIKit
import Firebase

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
        /* let user:Dictionary<String, AnyObject> = [
         "sample":"Hello"]
         
         let firebaseUpdate = DataService.dataservice._refFirebase.childByAppendingPath("users")
         firebaseUpdate.setValue(user)*/
        
        var ref = Firebase(url: "https://buffburgers.firebaseio.com")
        
        
        let email = txtUsername.text!
        let password = txtPassword.text!
        
        if ( email.isEmpty == false && password.isEmpty == false)
        {
            DataService.dataservice._refFirebase.authUser(email, password: password, withCompletionBlock: {(error, authData) in
                
                print("success")
                
                
                if  error != nil {
                    print(error.code)
                    print("Test 2")
                    
                    let alertView:UIAlertView = UIAlertView()
                    alertView.title = "Sign in Failed!"
                    alertView.message = "Username or password Invalid"
                    alertView.delegate = self
                    alertView.addButtonWithTitle("OK")
                    alertView.show()
                }
                else
                {
                    print("there was no error")
                }
                
            })
        }
            
        else{
            let alertView:UIAlertView = UIAlertView()
            alertView.title = "Sign in Failed!"
            alertView.message = "Please enter Email and Password"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        }
    }
    
        
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }
}
