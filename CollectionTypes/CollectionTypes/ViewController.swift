//
//  ViewController.swift
//  CollectionTypes
//
//  Created by Harsh Patel on 3/1/17.
//  Copyright © 2017 Harsh Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var newItem: UITextField!
    
    @IBOutlet weak var currentShoppingList: UITextView!
    
    
    var myShopppingList: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myShopppingList.append("Eggs")
        myShopppingList.append("Milk")
        myShopppingList.insert("Cookies", at: 0)
        myShopppingList.remove(at: 1)
        print ("MY SHOPPING LISTS HAS \(myShopppingList.count) items in it")
        print ("They are \(myShopppingList)")
        print ("The first item on the shipping list is \(myShopppingList[0])")
        
        for index in 0..<myShopppingList.count{
            
            print(index)
            currentShoppingList.text.append("\(myShopppingList[index])\n")
            
        }
    }
 
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addItem(_ sender: Any) {
        if(newItem.text != ""){
            
            myShopppingList.append(newItem.text!)

        }
        currentShoppingList.text = ""
        for index in 0..<myShopppingList.count{
            
            currentShoppingList.text.append("\(myShopppingList[index])\n")
            
        }
        
    }

}

