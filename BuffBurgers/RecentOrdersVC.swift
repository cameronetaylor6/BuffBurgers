//
//  RecentOrdersVC.swift
//
//  TODO: make ords hold most recent orders and limit to 3
//
//  Created by Callie Jones on 4/3/16.
//
//git push origin calliesbranch

import UIKit
import Firebase

class RecentOrdersVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableview: UITableView!
    var ords : [String] = []
    var orders : [[String]] = []
    
    var status : String = "Pending"
    var userburger : String = ""
    var userheat : String = ""
    var usercheese : String = ""
    var userbun : String = ""
    var lettuce : String = "No Lettuce"
    var tomato : String = "No Tomato"
    var onion : String = "No Onion"
    var pickle : String = "No Pickle"
    
    lazy var order1 : [String:String] = ["userID": userID, "status": self.status, "burger": self.userburger, "heat": self.userheat, "cheese": self.usercheese, "bun": self.userbun, "lettuce": self.lettuce, "tomato": self.tomato, "onion": self.onion, "pickle": self.pickle]
    
    func getOrders(){
        //connects to database and captures the current data of orders
        DataService.dataservice._refFirebase.childByAppendingPath("orders").queryLimitedToLast(3).observeEventType(
            FEventType.Value, withBlock: { snapshot in
                
                //loops through the current data of each child of orders
                for child in snapshot.children
                {
                    
                    let childSnapshot = snapshot.childSnapshotForPath(child.key)
                    let id = childSnapshot.value["userID"]
                    
                    //compares ids to grab orders of only the user logged in
                    if userID.isEqual(id)
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
                for var object in self.orders
                {
                    //creates string to show in recent orders table
                    var c = object.joinWithSeparator(", ")
                    c = c.stringByReplacingOccurrencesOfString(", ,", withString: ",")
                    //c = c.stringByReplacingOccurrencesOfString(",,,, ", withString: ", ")
                    //c = c.stringByReplacingOccurrencesOfString(",,, ", withString: ",
                    self.ords.append(c)
                    self.ords = self.ords.reverse()
                    print(c)
                }
                
                
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        getOrders()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        tableview.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ords.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //CODE TO BE RUN ON CELL TOUCH
        let indexPath = tableView.indexPathForSelectedRow!;
        let currentCell = tableView.cellForRowAtIndexPath(indexPath) as UITableViewCell!;
        var ordStr = currentCell.textLabel?.text
        var ordArr = ordStr?.componentsSeparatedByString(" , ")
        print(ordArr)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel!.numberOfLines = 0
        cell.textLabel?.text = ords[indexPath.item] as? String
        cell.textLabel!.lineBreakMode = NSLineBreakMode.ByWordWrapping
        return cell
    }
    
}
