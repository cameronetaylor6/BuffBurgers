//
//  CompletedOrdersVC.swift
//  BuffBurgers
//
//  Created by Callie Jones on 4/18/16.
//  Copyright © 2016 CSCI 3308. All rights reserved.
//

import UIKit
import Firebase
//import PendingOrdersVC.swift


class CompletedOrdersVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var completeOrderTable: UITableView!
    //var completeOrds : [String] = []
    var data : [String] = ["1","2","3"]
    var orders : [[String]] = []
    
    @IBAction func pendingTapped(sender : UIButton){
        
        self.performSegueWithIdentifier("pending", sender: nil)
    }
    
    func getCompleteOrders(){
     
        DataService.dataservice._refFirebase.childByAppendingPath("orders").observeEventType(
            FEventType.Value, withBlock: { snapshot in
                
                //loops through the current data of each child of orders
                for child in snapshot.children
                {
                    let childSnapshot = snapshot.childSnapshotForPath(child.key)
                    let status = childSnapshot.value["status"] as! String
                    
                    if status.isEqual("Complete")
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
                    completeOrds.append(c)
                    print(c)
                }
        })
        print ("completeOrds ",completeOrds)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        completeOrderTable.dataSource = self
        completeOrderTable.delegate = self
        completeOrds.removeAll()
        getCompleteOrders()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        completeOrderTable.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return completeOrds.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel!.numberOfLines = 0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 160.0
        cell.textLabel?.text = completeOrds[indexPath.item]
        cell.textLabel!.lineBreakMode = NSLineBreakMode.ByWordWrapping
        return cell
    }
}
