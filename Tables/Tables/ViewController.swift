//
//  ViewController.swift
//  Tables
//
//  Created by Harsh Patel on 3/15/17.
//  Copyright © 2017 Harsh Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var newItemFirld: UITextField!
    @IBOutlet weak var shoppingData: UITableView!
    
    let defaults = UserDefaults.standard
    
    
    var shoppinglist: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.white
        // Do any additional setup after loading the view, typically from a nib.
        //shoppinglist = ["Milk", "Eggs", "Cookies", "Chocolate"]
        
        
        if(defaults.object(forKey: "list") != nil){
        shoppinglist = defaults.object(forKey: "list") as! [String]
            shoppinglist.sort()
        
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let numberOfItems = shoppinglist.count
        
        return numberOfItems
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle==UITableViewCellEditingStyle.delete){
            
        shoppinglist.remove(at: indexPath.row)

            defaults.set(shoppinglist, forKey: "list")
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        
    }
    
    }
    
    
    @IBAction func addButton(_ sender: Any) {
        if(newItemFirld.text != ""){
            
            
            
            shoppinglist.append(newItemFirld.text!)
            shoppinglist.sort()
            
            defaults.set(shoppinglist, forKey: "list")
            shoppingData.reloadData()
            newItemFirld.text=""
        
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let item = shoppinglist[indexPath.row]
        
        cell.textLabel?.text = item
        return cell
        
        
    }
    
    //METHOD TO CHECK IF USER SEECTED ROW
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //performs segue to other screen
        performSegue(withIdentifier: "ShoppingList", sender: shoppinglist[indexPath.row])
    }
    
    //preparing segue for a view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //gives access to other view controller's varables
        let sendData = segue.destination as! NameOfItem
        
        //changes receivedData from other view controller to whatever user selected as a String
        
        sendData.receivedData = sender as! String
        
    }
    
}

