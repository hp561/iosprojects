//
//  NameOfItem.swift
//  Tables
//
//  Created by Harsh Patel on 3/21/17.
//  Copyright © 2017 Harsh Patel. All rights reserved.
//

import UIKit

class NameOfItem: UIViewController {

    @IBOutlet weak var received: UILabel!
    var receivedData = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        received.text=receivedData
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
