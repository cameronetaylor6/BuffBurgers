//
//  SignupVC.swift
//  SwiftLoginScreen
//
//  Created by Dipin Krishna on 31/07/14.
//  Copyright (c) 2014 Dipin Krishna. All rights reserved.
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
                            
                            let alertView:UIAlertView = UIAlertView()
                            alertView.title = "Sign Up Failed!"
                            alertView.message = "Account already exists"
                            alertView.delegate = self
                            alertView.addButtonWithTitle("OK")
                            alertView.show()
                        }
                            
                        else {
                            NSUserDefaults.standardUserDefaults().setValue(authData["uid"], forKey: "uid")
                            DataService.dataservice.refFirebase.authUser(email, password: password, withCompletionBlock: { error, result in
                                
                                let user = ["email": email]
                                DataService.dataservice.createUser(result.uid, user: user)//
                                
                            })
                            print("success")
                        }
                        
                        
                    })
                }
                else{
                    
                    let alertView:UIAlertView = UIAlertView()
                    alertView.title = "Sign Up Failed!"
                    alertView.message = "Please use a colorado email"
                    alertView.delegate = self
                    alertView.addButtonWithTitle("OK")
                    alertView.show()
                }
            }
            else{
                let alertView:UIAlertView = UIAlertView()
                alertView.title = "Sign Up Failed!"
                alertView.message = "Please renter your password"
                alertView.delegate = self
                alertView.addButtonWithTitle("OK")
                alertView.show()
            }
            
        }
            
        else{
            let alertView:UIAlertView = UIAlertView()
            alertView.title = "Sign Up Failed!"
            alertView.message = "Please enter Email and Password"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        }
        
    }
    
    
    
    //print(username.isEmpty)
    //print(password)
    
    //var users = [Users]()
    //var users = [)
    //username.isEmpty == false
    
    /*var user = [ "email":email, "password":password]
     
     
     
     
     if email == "" && password == "" {
     
     let alertView:UIAlertView = UIAlertView()
     alertView.title = "Sign Up Failed!"
     alertView.message = "Please enter Username and Password"
     alertView.delegate = self
     alertView.addButtonWithTitle("OK")
     alertView.show()
     } else if ( !password.isEqual(confirm_password) ) {
     
     let alertView:UIAlertView = UIAlertView()
     alertView.title = "Sign Up Failed!"
     alertView.message = "Passwords doesn't Match"
     alertView.delegate = self
     alertView.addButtonWithTitle("OK")
     alertView.show()
     } else {
     do {
     
     let firebaseUpdate = DataService.dataservice.refFb.childByAutoId()
     firebaseUpdate.setValue(user)
     
     DataService.dataservice.refFb.createUser(email, password: password, withCompletionBlock:
     {(error) in firebaseUpdate})*/
    
    /*let user:Dictionary<String, AnyObject> = [
     "sample":"Hello"]*/
    
    
    /*let post:NSString = "username=\(username)&password=\(password)&c_password=\(confirm_password)"
     
     NSLog("PostData: %@",post);
     
     let url:NSURL = NSURL(string: "")!
     
     let postData:NSData = post.dataUsingEncoding(NSASCIIStringEncoding)!
     
     let postLength:NSString = String( postData.length )
     
     let request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
     request.HTTPMethod = "POST"
     request.HTTPBody = postData
     request.setValue(postLength as String, forHTTPHeaderField: "Content-Length")
     request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
     request.setValue("application/json", forHTTPHeaderField: "Accept")
     
     
     var reponseError: NSError?
     var response: NSURLResponse?
     
     var urlData: NSData?
     do {
     urlData = try NSURLConnection.sendSynchronousRequest(request, returningResponse:&response)
     } catch let error as NSError {
     reponseError = error
     urlData = nil
     }
     
     if ( urlData != nil ) {
     let res = response as! NSHTTPURLResponse!;
     
     NSLog("Response code: %ld", res.statusCode);
     
     if (res.statusCode >= 200 && res.statusCode < 300)
     {
     let responseData:NSString  = NSString(data:urlData!, encoding:NSUTF8StringEncoding)!
     
     NSLog("Response ==> %@", responseData);
     
     //var error: NSError?
     
     let jsonData:NSDictionary = try NSJSONSerialization.JSONObjectWithData(urlData!, options:NSJSONReadingOptions.MutableContainers ) as! NSDictionary
     
     
     let success:NSInteger = jsonData.valueForKey("success") as! NSInteger
     
     //[jsonData[@"success"] integerValue];
     
     NSLog("Success: %ld", success);
     
     if(success == 1)
     {
     NSLog("Sign Up SUCCESS");
     self.dismissViewControllerAnimated(true, completion: nil)
     } else {
     var error_msg:NSString
     
     if jsonData["error_message"] as? NSString != nil {
     error_msg = jsonData["error_message"] as! NSString
     } else {
     error_msg = "Unknown Error"
     }
     let alertView:UIAlertView = UIAlertView()
     alertView.title = "Sign Up Failed!"
     alertView.message = error_msg as String
     alertView.delegate = self
     alertView.addButtonWithTitle("OK")
     alertView.show()
     
     }
     
     } else {
     let alertView:UIAlertView = UIAlertView()
     alertView.title = "Sign Up Failed!"
     alertView.message = "Connection Failed"
     alertView.delegate = self
     alertView.addButtonWithTitle("OK")
     alertView.show()
     }
     }  else {
     let alertView:UIAlertView = UIAlertView()
     alertView.title = "Sign in Failed!"
     alertView.message = "Connection Failure"
     if let error = reponseError {
     alertView.message = (error.localizedDescription)
     }
     alertView.delegate = self
     alertView.addButtonWithTitle("OK")
     alertView.show()
     }
     } catch {
     let alertView:UIAlertView = UIAlertView()
     alertView.title = "Sign Up Failed!"
     alertView.message = "Server Error!"
     alertView.delegate = self
     alertView.addButtonWithTitle("OK")
     alertView.show()
     }
     }
     */
}


/*func textFieldShouldReturn(textField: UITextField!) -> Bool {   //delegate method
 textField.resignFirstResponder()
 return true
 }*/








