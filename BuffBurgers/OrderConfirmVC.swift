//
//  OrderConfirmVC.swift
//  BuffBurgers
//
//  Created by Callie Jones on 4/19/16.
//  Copyright © 2016 CSCI 3308. All rights reserved.
//

import UIKit


class OrderConfirmVC: UIViewController {
    
    @IBAction func orderAgainTapped(sender : UIButton){
        
        performSegueWithIdentifier("orderAgain", sender: nil)
    }
    
    @IBAction func viewRecentTapped(sender : UIButton){
        
        performSegueWithIdentifier("viewRecent", sender: nil)
    }

}
