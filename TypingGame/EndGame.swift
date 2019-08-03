//
//  EndGame.swift
//  TypingGame
//
//  Created by Harsh Patel on 4/29/17.
//  Copyright © 2017 HP Tech. All rights reserved.
//

import UIKit

class EndGame: UIViewController {

    var receivedScore = ""
    
    @IBOutlet weak var score: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        score.text=receivedScore
        
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
