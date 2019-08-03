//
//  RegisterPageViewController.swift
//  allChat
//
//  Created by Harsh Patel on 2/19/17.
//  Copyright © 2017 Harsh Patel. All rights reserved.
//

import UIKit


class RegisterPageViewController: UIViewController {

    @IBOutlet weak var registerEmail: UITextField!
    
    @IBOutlet weak var registerPassword: UITextField!
    
    @IBOutlet weak var registerRePassword: UITextField!
    
    
    @IBOutlet weak var registerNickname: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func RegisterButton(_ sender: Any) {
        
        let userEmail = registerEmail.text
        let userPassword = registerPassword.text
        
        let userRePassword = registerRePassword.text
        
        let userNickname = registerNickname.text
        
        if ((userEmail?.isEmpty)!||(userPassword?.isEmpty)!||(userRePassword?.isEmpty)!||(userNickname?.isEmpty)!)
            
        {
        
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
