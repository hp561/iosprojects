//
//  ViewController.swift
//  Timer
//
//  Created by Harsh Patel on 3/29/17.
//  Copyright © 2017 Harsh Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var countdown: UILabel!
    
    var time = 0
    
    var timer = Timer()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pause(_ sender: Any) {
        timer.invalidate()
        
    }

    @IBAction func start(_ sender: Any) {
        
        timer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
        
        
    }
    @IBAction func reset(_ sender: Any) {
        
        timer.invalidate()
        time=0
        countdown.text = String(time)
    }
    
    func action(){
    
     time += 1
        
        countdown.text = String(time)
    
    }
}

