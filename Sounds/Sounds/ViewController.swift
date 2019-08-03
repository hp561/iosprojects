//
//  ViewController.swift
//  Sounds
//
//  Created by Harsh Patel on 3/28/17.
//  Copyright © 2017 Harsh Patel. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let sound = URL(fileURLWithPath: Bundle.main.path(forResource: "sound", ofType: "mp3")!)
    var audioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playSound(_ sender: Any) {
        
        do{
        
            try
                audioPlayer = AVAudioPlayer(contentsOf:self.sound)
            audioPlayer!.play()
            
        }
        catch{
            
            print("Did not find sound file!")
        
        }
        
        
        
        
    }

}

