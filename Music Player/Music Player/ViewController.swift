//
//  ViewController.swift
//  Music Player
//
//  Created by Harsh Patel on 3/28/17.
//  Copyright © 2017 Harsh Patel. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

    var numberOfLoops = 0
    var pause=false

    @IBOutlet weak var songPlaying: UILabel!
    
    let sound = URL(fileURLWithPath: Bundle.main.path(forResource: "sound", ofType: "mp3")!)
    @IBOutlet weak var loops: UITextField!
    
    var audioPlayer: AVAudioPlayer?
    var audioSession = AVAudioSession.sharedInstance()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do{
            
            try
                audioPlayer = AVAudioPlayer (contentsOf:self.sound)
            
            try audioSession.setCategory(AVAudioSessionCategoryPlayback)
            
        }
            
        catch{
            
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func songSelector(_ sender: Any) {
        
        
        if(audioPlayer?.isPlaying)!{
            
            let alert = UIAlertController(title: "Error", message: "Song is playing. Wait until the loop is over or terminate and restart.", preferredStyle:.alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            

        
        
        }
        if(pause==true){
        
        audioPlayer?.play()
        
        
        }
        else if(loops.text != "" && loops.text != "0" ){
        
        numberOfLoops = (Int(loops.text!)!)-1

            
        audioPlayer?.numberOfLoops = numberOfLoops
        audioPlayer?.play()
            
        }
            
        else{
        
        let alert = UIAlertController(title: "Error", message: "Enter the amount of times you want the song to play. Can't be 0.", preferredStyle:.alert)
            
        alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: nil))
            
        self.present(alert, animated: true, completion: nil)
        
        }
        loops.text=""
        pause=false

        
        
    }
  
    @IBAction func stop(_ sender: Any) {
        if((audioPlayer?.isPlaying)! || pause==true){
        
            audioPlayer?.stop()
            
            audioPlayer?.currentTime = 0
            numberOfLoops = 0
            pause=false

        }
        else{
            
            let alert = UIAlertController(title: "Error", message: "No song is currently playing.", preferredStyle:.alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            

        
        
        
        }
        
    }

    @IBAction func pauseButton(_ sender: Any) {
        
        if(audioPlayer?.isPlaying)!{
        
        audioPlayer?.pause()
        pause=true
        
        }
    }


}

