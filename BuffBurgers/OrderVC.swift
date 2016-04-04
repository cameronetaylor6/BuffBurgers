//
//  Order.swift
//  BuffBurgers
//
//  Created by Callie Jones on 4/3/16.
//  Copyright © 2016 CSCI 3308. All rights reserved.
//

//import Cocoa
import Firebase
import UIKit
class OrderVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var Burgerchoices = ["Hamburger", "Veggie Burger", "Daily Special"]
    var Heatchoices = ["155", "160", "170", "175"]
    var Cheesechoices = ["Cheddar", "Provolone", "Swiss", "Pepper Jack"]
    var Bunchoices = ["Regular Bun", "Lettuce Wrap", "Gluten Free Bun"]
    @IBOutlet weak var Burger: UIPickerView!
    @IBOutlet weak var Heat: UIPickerView!
    @IBOutlet weak var Cheese: UIPickerView!
    @IBOutlet weak var Bun: UIPickerView!
    var userburger : String = ""
    var userheat : String = ""
    var usercheese : String = ""
    var userbun : String = ""
    var lettuce : Int = 0
    var tomato : Int = 0
    var onion : Int = 0
    var pickle : Int = 0
    
    @IBOutlet weak var Lcheck: UIButton!
    @IBOutlet weak var Tcheck: UIButton!
    @IBOutlet weak var Ocheck: UIButton!
    @IBOutlet weak var Pcheck: UIButton!
    
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
        Ocheck.setTitle("◻️", forState: UIControlState.Normal)
        Pcheck.setTitle("◻️", forState: UIControlState.Normal)

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
            print("wrong")
            return 0
        }
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView.tag == 1){
            userburger = "\(Burgerchoices[row])"
            print("burger")
            return "\(Burgerchoices[row])"
        }
        if (pickerView.tag == 2){
            userburger = "\(Heatchoices[row])"
            print("heat")
            return "\(Heatchoices[row])"
        }
        if (pickerView.tag == 3){
            userburger = "\(Cheesechoices[row])"
            print("cheese")
            return "\(Cheesechoices[row])"
        }
        if (pickerView.tag == 4){
            userburger = "\(Bunchoices[row])"
            print("bun")
            return "\(Bunchoices[row])"
        }
        else{
         return "error"
        }
    }
    

     @IBAction func LettuceTapped(sender : UIButton){
        if Lcheck.currentTitle == "◻️" {
            Lcheck.setTitle("✅", forState: .Normal)
            lettuce = 1
            print(lettuce)
        }
        else{
        Lcheck.setTitle("◻️", forState: .Normal)
        lettuce = 0
            print("lettuce ", lettuce)
        }
    }
    
    @IBAction func TomatoTapped(sender : UIButton){
        if Tcheck.currentTitle == "◻️" {
            Tcheck.setTitle("✅", forState: .Normal)
            tomato = 1
            print("tomato checked", tomato)
        }
        else{
            Tcheck.setTitle("◻️", forState: .Normal)
            tomato = 0
            print("tomato unchecked", tomato)
        }
    }
    
    @IBAction func OnionTapped(sender : UIButton){
        if Ocheck.currentTitle == "◻️" {
            Ocheck.setTitle("✅", forState: .Normal)
            onion = 1
            print("onion checked", onion)
        }
        else{
            Ocheck.setTitle("◻️", forState: .Normal)
            onion = 0
            print("onion unchecked", onion)
        }
    }
    
    @IBAction func PickleTapped(sender : UIButton){
        if Pcheck.currentTitle == "◻️" {
            Pcheck.setTitle("✅", forState: .Normal)
            pickle = 1
            print("pickle checked", pickle)
        }
        else{
            Pcheck.setTitle("◻️", forState: .Normal)
            pickle = 0
            print("pickle unchecked", pickle)
        }
    }
    
    @IBAction func PlaceOrderTapped(sender : UIButton){
        
        
        let order1 = ["burger": userburger, "heat": userheat, "cheese": usercheese, "bun": userbun, "lettuce": lettuce, "tomato": tomato, "onion": onion, "pickle": pickle]
        print(order1)
        //let order1Ref = DataService.dataservice._refFirebase.childByAppendingPath("orders").childByAutoId()
        //order1Ref.setValue(order1)
        //do this so long as there was no error
        self.performSegueWithIdentifier("order_confirmed", sender: nil)
    }
    
    
}
