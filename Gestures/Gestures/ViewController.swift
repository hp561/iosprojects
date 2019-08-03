//
//  ViewController.swift
//  Gestures
//
//  Created by Harsh Patel on 3/28/17.
//  Copyright © 2017 Harsh Patel. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

   
    @IBOutlet weak var tapView: UILabel!
    
    @IBOutlet weak var longView: UILabel!
    
    @IBOutlet weak var panView: UILabel!
    
    @IBOutlet weak var swipeView: UILabel!
    
    @IBOutlet weak var rotateView: UILabel!
    
    @IBOutlet weak var pinchView: UILabel!
    
    let tapRecognizer=UITapGestureRecognizer()

    let swipeRecognizer = UISwipeGestureRecognizer()
    let rotRec = UIRotationGestureRecognizer()
    let longRec = UILongPressGestureRecognizer()
    let pinchRec = UIPinchGestureRecognizer()
    let panRec = UIPanGestureRecognizer ()
    
    let tapSound = URL(fileURLWithPath: Bundle.main.path(forResource: "tap", ofType: "mp3")!)
    
    let swipeSound = URL(fileURLWithPath: Bundle.main.path(forResource: "swipe", ofType: "mp3")!)
    
    let rotSound = URL(fileURLWithPath: Bundle.main.path(forResource: "rotate", ofType: "mp3")!)
    
    let longSound = URL(fileURLWithPath: Bundle.main.path(forResource: "long_press", ofType: "mp3")!)
    
    let panSound = URL(fileURLWithPath: Bundle.main.path(forResource: "pan", ofType: "mp3")!)
    
    let pinchSound = URL(fileURLWithPath: Bundle.main.path(forResource: "pinch", ofType: "mp3")!)
    
    var audioPlayer: AVAudioPlayer?


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        tapRecognizer.addTarget(self, action: #selector(ViewController.tappedView))
        tapView.addGestureRecognizer(tapRecognizer)
        tapView.isUserInteractionEnabled = true
        
        swipeRecognizer.addTarget(self, action: #selector(ViewController.swipedView))
        swipeView.addGestureRecognizer(swipeRecognizer)
        swipeView.isUserInteractionEnabled = true
        
        rotRec.addTarget(self, action: #selector(ViewController.rotView))
        rotateView.addGestureRecognizer(rotRec)
        rotateView.isUserInteractionEnabled = true
        
        longRec.addTarget(self, action: #selector(ViewController.longgedView))
        longView.addGestureRecognizer(longRec)
        longView.isUserInteractionEnabled = true
        
        pinchRec.addTarget(self, action: #selector(ViewController.pinchedView))
        pinchView.addGestureRecognizer(pinchRec)
        pinchView.isUserInteractionEnabled = true
        
        panRec.addTarget(self, action: #selector(ViewController.pannedView))
        panView.addGestureRecognizer(panRec)
        panView.isUserInteractionEnabled = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tappedView(){
    
//        let alert = UIAlertController(title: "Tapped", message: "You just tapped", preferredStyle:.alert)
//        
////        alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: nil))
////        
////        self.present(alert, animated: true, completion: nil)
        
        do{
            
            try
                audioPlayer = AVAudioPlayer(contentsOf:self.tapSound)
            audioPlayer!.play()
            
        }
        catch{
            
            print("Did not find sound file!")
            
        }

    }
    
    func swipedView(){
        
//        let alert = UIAlertController(title: "Swiped", message: "You just swiped", preferredStyle:.alert)
//        
//        alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: nil))
//        
//        self.present(alert, animated: true, completion: nil)
        do{
            
            try
                audioPlayer = AVAudioPlayer(contentsOf:self.swipeSound)
            audioPlayer!.play()
            
        }
        catch{
            
            print("Did not find sound file!")
            
        }

    }
    
    func rotView(){
        
//        let alert = UIAlertController(title: "Rotated", message: "You just rotated", preferredStyle:.alert)
//        
//        alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: nil))
//        
//        self.present(alert, animated: true, completion: nil)
        
        do{
            
            try
                audioPlayer = AVAudioPlayer(contentsOf:self.rotSound)
            audioPlayer!.play()
            
        }
        catch{
            
            print("Did not find sound file!")
            
        }

    }
    
    func longgedView(){
        
//        let alert = UIAlertController(title: "Long Pressed", message: "You just long pressed", preferredStyle:.alert)
//        
//        alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: nil))
//        
//        self.present(alert, animated: true, completion: nil)
        do{
            
            try
                audioPlayer = AVAudioPlayer(contentsOf:self.longSound)
            audioPlayer!.play()
            
        }
        catch{
            
            print("Did not find sound file!")
            
        }

    }

    func pinchedView(){
        
//        let alert = UIAlertController(title: "Pinched", message: "You just long pinched", preferredStyle:.alert)
//        
//        alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: nil))
//        
//        self.present(alert, animated: true, completion: nil)
        
        do{
            
            try
                audioPlayer = AVAudioPlayer(contentsOf:self.pinchSound)
            audioPlayer!.play()
            
        }
        catch{
            
            print("Did not find sound file!")
            
        }

    }

    func pannedView(){
        
//        let alert = UIAlertController(title: "Panned", message: "You just long panned", preferredStyle:.alert)
//        
//        alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: nil))
//        
//        self.present(alert, animated: true, completion: nil)
//    }

        do{
            
            try
                audioPlayer = AVAudioPlayer(contentsOf:self.panSound)
            audioPlayer!.play()
            
        }
        catch{
            
            print("Did not find sound file!")
            
        }



    }
}

