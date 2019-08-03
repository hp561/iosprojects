//
//  ViewController.swift
//  Types and Console
//
//  Created by Harsh Patel on 2/14/17.
//  Copyright © 2017 Harsh Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let myDouble = 7.0
    let myInt = 9000
    let myBool = true
    
   
    @IBOutlet weak var Label1: UILabel!
   
    
    @IBOutlet weak var Label2: UILabel!
    
    
    @IBOutlet weak var Label3: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func myButton(_ sender: Any) {
        
        Label1.text = "myDouble - \(type (of:myDouble)) - \(myDouble)"
        Label2.text = "myInt - \(type (of:myInt)) - \(myInt)"
        Label3.text = "myBool - \(type (of:myBool)) - \(myBool)"
        
        
        
    }

}

