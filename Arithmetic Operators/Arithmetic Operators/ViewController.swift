//
//  ViewController.swift
//  Arithmetic Operators
//
//  Created by Harsh Patel on 2/17/17.
//  Copyright © 2017 Harsh Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var operand1: UITextField!
    
    @IBOutlet weak var operand2: UITextField!
    
    @IBOutlet weak var result: UILabel!
    
    
    var value1 = 0.0;
    var value2 = 0.0;
    var modval = 0;
    var modval2 = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func multiply(_ sender: Any) {
        
        value1 = Double(operand1.text!)!
        value2 = Double(operand2.text!)!
        
        result.text="\(value1*value2)"
    }
   
    @IBAction func divide(_ sender: Any) {
        value1 = Double(operand1.text!)!
        value2 = Double(operand2.text!)!
        
        result.text="\(value1/value2)"
    }
    
    @IBAction func add(_ sender: Any) {
        value1 = Double(operand1.text!)!
        value2 = Double(operand2.text!)!
        
        result.text="\(value1+value2)"
    }
    @IBAction func sub(_ sender: Any) {
        value1 = Double(operand1.text!)!
        value2 = Double(operand2.text!)!
        
        result.text="\(value1-value2)"
    }
    @IBAction func mod(_ sender: Any) {
        modval = Int(operand1.text!)!
        modval2 = Int(operand2.text!)!
        
        result.text="\(modval % modval2)"
    }
}

