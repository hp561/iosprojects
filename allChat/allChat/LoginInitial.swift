//
//  LoginInitial.swift
//  allChat
//
//  Created by Harsh Patel on 12/18/17.
//  Copyright © 2017 Harsh Patel. All rights reserved.
//

import UIKit

class LoginInitial: UIViewController {

    @IBOutlet weak var e_mail: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func Login(_ sender: Any) {
        
        let test = e_mail.text
        
        if(test=="hello"){
            
            performSegue(withIdentifier: "allChatPage", sender: Any?)
        }
        
        else{
        
        return
        }
        
        
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
