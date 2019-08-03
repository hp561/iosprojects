//
//  ViewController.swift
//  Outlets and Actions
//
//  Created by Harsh Patel on 2/13/17.
//  Copyright © 2017 Harsh Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var changingText = "Hello World"
    let unChngingText = "This cannot change"
    
    
    
    @IBOutlet weak var myLabel: UILabel!
    
    
    
    
  
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func myButton(_ sender: Any) {
        changingText = "New Text!"
       myLabel.text = changingText
        
        
        
    }

}

