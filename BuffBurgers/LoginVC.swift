//
//  LoginVC.swift
//  SwiftLoginScreen
//
// need to add more failure/connection error alert messages
//

import UIKit
import Firebase
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

var userID : String = ""


class LoginVC: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet var txtUsername : UITextField!
    @IBOutlet var txtPassword : UITextField!
    var mail : UITextField!
    var error_msg:NSString = ""
    var reponseError: NSError?
    var response: NSURLResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    @IBAction func signinTapped(sender : UIButton)
    {
        //var ref = Firebase(url: "https://buffburgers.firebaseio.com")
        
        
        let email = txtUsername.text!
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
                    userID = email
                    if email == "jonescal000@gmail.com"
                    {
                        self.performSegueWithIdentifier("provider", sender: nil)
                    }
                    else{
                        self.performSegueWithIdentifier("logged_in", sender: nil)
                    }
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
    
    @IBAction func forgotpasswordTapped(sender : UIButton)
    {
        let alertController = UIAlertController(title: "Password Reset Request", message: "Please Enter Account Email", preferredStyle: .Alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .Default, handler: {
            (action) -> Void in
            self.mail = alertController.textFields![0] as UITextField
            
            DataService.dataservice._refFirebase.resetPasswordForUser(self.mail.text!, withCompletionBlock: { error in
                if error != nil
                {
                    // There was an error processing the request
                    let alertController = UIAlertController(title: "Password Reset Failed!", message: "There is no Account for this Email", preferredStyle: .Alert)
                    let OKAction = UIAlertAction(title: "OK", style: .Cancel) { action -> Void in }
                    alertController.addAction(OKAction)
                    self.presentViewController(alertController, animated: true, completion: nil)
                    print("NO error")
                }
                else
                {
                    // Password reset sent successfully
                    let alertController = UIAlertController(title: "Password is Reset!", message: "Please Check Your Email", preferredStyle: .Alert)
                    let OKAction = UIAlertAction(title: "OK", style: .Cancel) { action -> Void in }
                    alertController.addAction(OKAction)
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
            })
            
        })
        
        alertController.addTextFieldWithConfigurationHandler { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Account Email"
        }
        alertController.addAction(OKAction)
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }
}
