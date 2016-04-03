//
//  FirebaseData.swift
//  SwiftLoginScreen
//
//  Created by Callie Jones on 4/2/16.
//  Copyright © 2016 Dipin Krishna. All rights reserved.
//

import Firebase

let url = "https://buffburgers.firebaseio.com"

let userUrl = "https://buffburgers.firebaseio.com/users"

class DataService {
    
    static let dataservice = DataService()
    
    let refFirebase = Firebase(url: "\(url)")
    let refFb = Firebase(url: "\(userUrl)")
    
    var _refFirebase: Firebase {
        return refFirebase
    }
    
    var refUserFB: Firebase{
        return refFb
    }
    
    var refusercurrent: Firebase {
        
        let uid = NSUserDefaults.standardUserDefaults().valueForKey("uid") as! String
        let user = Firebase(url: "\(url)").childByAppendingPath("users").childByAppendingPath("uid")
        
        return user
        
    }
    
    func createUser(uid: String, user: Dictionary<String, String>) {
        
        refFb.childByAppendingPath(uid).setValue(user)
        
    }
    
}
