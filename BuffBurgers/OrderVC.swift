//
//  Order.swift
//  BuffBurgers
//
//  Created by Callie Jones on 4/3/16.
//  Copyright © 2016 CSCI 3308. All rights reserved.
//NOTE checkboxes will list empty string if not Tapped

//import Cocoa
import Firebase
import UIKit
class OrderVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var Burgerchoices = ["Hamburger", "Veggie Burger", "Daily Special"]
    var Heatchoices = ["155", "160", "170", "175"]
    var Cheesechoices = ["No Cheese", "Cheddar", "Provolone", "Swiss", "Pepper Jack"]
    var Bunchoices = ["Regular Bun", "Lettuce Wrap", "Gluten Free Bun"]
    @IBOutlet weak var Burger: UIPickerView!
    @IBOutlet weak var Heat: UIPickerView!
    @IBOutlet weak var Cheese: UIPickerView!
    @IBOutlet weak var Bun: UIPickerView!
    var userburger : String = ""
    var userheat : String = ""
    var usercheese : String = ""
    var userbun : String = ""
    var lettuce : String = ""
    var tomato : String = ""
    var onion : String = ""
    var pickle : String = ""
    
    @IBOutlet weak var Lcheck: UIButton!
    @IBOutlet weak var Tcheck: UIButton!
    @IBOutlet weak var Ocheck: UIButton!
    @IBOutlet weak var Pcheck: UIButton!
    
    var order1:[String:String] = [:]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Burger.delegate = self
        Burger.dataSource = self
        Heat.delegate = self
        Heat.dataSource = self
        Cheese.delegate = self
        Cheese.dataSource = self
        Bun.delegate = self
        Bun.dataSource = self
        Lcheck.setTitle("◻️", forState: UIControlState.Normal)
        Tcheck.setTitle("◻️", forState: UIControlState.Normal)
        Ocheck.setTitle("◻️", forState: UIControlState.Normal)
        Pcheck.setTitle("◻️", forState: UIControlState.Normal)
    }
    
    override func viewWillAppear(animated: Bool) {
        //Lcheck.setTitle("✅", forState: UIControlState.Selected)
        //Tcheck.setTitle("◻️", forState: UIControlState.Normal)
        //Ocheck.setTitle("◻️", forState: UIControlState.Normal)
        //Pcheck.setTitle("◻️", forState: UIControlState.Normal)

    }
    
    
    //functions for pickerviews
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if (pickerView.tag == 1){
            return Burgerchoices.count
        }
        if (pickerView.tag == 2){
            return Heatchoices.count
        }
        if (pickerView.tag == 3){
            return Cheesechoices.count
        }
        if (pickerView.tag == 4){
            return Bunchoices.count
        }
        else{
            print("need to fill all")
            return 0
        }
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView.tag == 1){
            userburger = "\(Burgerchoices[row])"
            return "\(Burgerchoices[row])"
        }
        if (pickerView.tag == 2){
            userheat = "\(Heatchoices[row])"
            return "\(Heatchoices[row])"
        }
        if (pickerView.tag == 3){
            usercheese = "\(Cheesechoices[row])"
            return "\(Cheesechoices[row])"
        }
        if (pickerView.tag == 4){
            userbun = "\(Bunchoices[row])"
            return "\(Bunchoices[row])"
        }
        else{
         return "error"
        }
    }
    

     @IBAction func LettuceTapped(sender : UIButton){
        if Lcheck.currentTitle == "◻️" {
            //update button to select icon
            Lcheck.setTitle("✅", forState: .Normal)
            lettuce = "Lettuce"
            order1.updateValue("Lettuce", forKey: lettuce)
        }
        else{
            //update button to deselect icon
            Lcheck.setTitle("◻️", forState: .Normal)
            lettuce = "No Lettuce"
            order1.updateValue("0", forKey: lettuce)
        }
    }
    
    @IBAction func TomatoTapped(sender : UIButton){
        if Tcheck.currentTitle == "◻️" {
            //update button to select icon
            Tcheck.setTitle("✅", forState: .Normal)
            order1.updateValue("Tomato", forKey: tomato)
        }
        else{
            //update button to deselect icon
            Tcheck.setTitle("◻️", forState: .Normal)
            order1.updateValue("0", forKey: tomato)
        }
    }
    
    @IBAction func OnionTapped(sender : UIButton){
        if Ocheck.currentTitle == "◻️" {
            //update button to select icon
            Ocheck.setTitle("✅", forState: .Normal)
            order1.updateValue("Onion", forKey: onion)
        }
        else{
            //update button to delselect icon
            Ocheck.setTitle("◻️", forState: .Normal)
            order1.updateValue("0", forKey: onion)
        }
    }
    
    @IBAction func PickleTapped(sender : UIButton){
        if Pcheck.currentTitle == "◻️" {
            Pcheck.setTitle("✅", forState: .Normal)
            order1.updateValue("Pickle", forKey: pickle)
        }
        else{
            Pcheck.setTitle("◻️", forState: .Normal)
            order1.updateValue("0", forKey: pickle)
        }
    }
    
    @IBAction func PlaceOrderTapped(sender : UIButton){
       //set buttons to empty if not tapped
       order1.updateValue("0", forKey: lettuce)
       order1.updateValue("0", forKey: tomato)
       order1.updateValue("0", forKey: onion)
       order1.updateValue("0", forKey: pickle)
       order1 = ["userID": userID, "burger": userburger, "heat": userheat, "cheese": usercheese, "bun": userbun, "lettuce": lettuce, "tomato": tomato, "onion": onion, "pickle": pickle]
        let order1Ref = DataService.dataservice._refFirebase.childByAppendingPath("orders").childByAutoId()
        order1Ref.setValue(order1)
        //do this so long as there was no error
        self.performSegueWithIdentifier("order_confirmed", sender: nil)
    }
    
    
}
