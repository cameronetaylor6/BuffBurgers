//
//  PendingOrdersVC.swift
//  BuffBurgers
//
//  Created by Callie Jones on 4/18/16.
//  Copyright © 2016 CSCI 3308. All rights reserved.
//

import UIKit
import Firebase
var pendingOrds : [String] = []
var completeOrds : [String] = []

class PendingOrdersVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var pendingOrderTable: UITableView!
    //var pendingOrds : [String] = []
    var orders : [[String]] = []
    var data : [AnyObject] = []
    
    func getPendingOrders(){
        
        DataService.dataservice._refFirebase.childByAppendingPath("orders").queryLimitedToFirst(20).observeEventType(
            FEventType.Value, withBlock: { snapshot in
                
                //loops through the current data of each child of orders
                for child in snapshot.children
                {
                    let childSnapshot = snapshot.childSnapshotForPath(child.key)
                    let status = childSnapshot.value["status"] as! String
                    //self.data.append(snapshot.value as! String)
                    self.data += [snapshot.value]
                    
                    if status.isEqual("Pending")
                    {
                        let burger = childSnapshot.value["burger"] as! String
                        let heat = childSnapshot.value["heat"] as! String
                        let cheese = childSnapshot.value["cheese"] as! String
                        let bun = childSnapshot.value["bun"] as! String
                        let lettuce = childSnapshot.value["lettuce"] as! String
                        let tomato = childSnapshot.value["tomato"] as! String
                        let onion = childSnapshot.value["onion"] as! String
                        let pickle = childSnapshot.value["pickle"] as! String
                        let order = [burger, heat, cheese, bun, lettuce, tomato, onion, pickle]
                        self.orders.append(order)
                        
                    }

                        
                }
                
                print("orders ", self.orders)
                //loops through every order in array of users total orders
                for object in self.orders
                {
                    //creates string to show in recent orders table
                    var c = object.joinWithSeparator(", ")
                    c = c.stringByReplacingOccurrencesOfString(", ,", withString: ",")
                    pendingOrds.append(c)
                    print("table: ", pendingOrds)
                    print("cell: ",c)
                    print(pendingOrds.count)
                }
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pendingOrderTable.dataSource = self
        pendingOrderTable.delegate = self
        getPendingOrders()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        pendingOrderTable.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pendingOrds.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel!.numberOfLines = 0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 160.0
        cell.textLabel?.text = pendingOrds[indexPath.item]
        cell.textLabel!.lineBreakMode = NSLineBreakMode.ByWordWrapping
        return cell
    }
    
    @IBAction func completedOrdersTapped(sender : UIButton){
        
        pendingOrds.removeAll()
        self.performSegueWithIdentifier("completed", sender: nil)
        
        
    }
    
     @IBAction func allDoneTapped(sender : UIButton)
     {
        let newstat = ["status": "Complete"]
        print("data ",data)
        //DataService.dataservice._refFirebase.childByAppendingPath("orders").childByAppendingPath("KFc7ETWUlItSdZ8oZjM").updateChildValues(["status" : "Complete"])
        print(data[0])
        //DataService.dataservice._refFirebase.childByAppendingPath("orders").updateChildValues(["status" : "Complete"])
        //DataService.dataservice._refFirebase.childByAppendingPath("orders").childByAppendingPath("KFc7ETWUlItSdZ8oZjM").childByAppendingPath("status") = newstat
        
        /*DataService.dataservice._refFirebase.childByAppendingPath("orders").observeEventType(
            FEventType.Value, withBlock: { snapshot in
                
                //loops through the current data of each child of orders
                
                for child in snapshot.children
                {
                    let childSnapshot = snapshot.childSnapshotForPath(child.key)
                    
                    
                    //childSnapshot.setValue("Complete", forKey: "status")
                    //childSnapshot.value["status"]
                    self.data += [snapshot.value]
                }
            })*/


    }


}
