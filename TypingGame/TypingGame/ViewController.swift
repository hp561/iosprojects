//
//  ViewController.swift
//  TypingGame
//
//  Created by Harsh Patel on 4/4/17.
//  Copyright © 2017 HP Tech. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate  {
    
    var words = [String]()
    var count = 0;
    var cell : UITableViewCell?
    let correctSound = URL(fileURLWithPath: Bundle.main.path(forResource: "tap", ofType: "mp3")!)
    let wrongSound = URL(fileURLWithPath: Bundle.main.path(forResource: "no", ofType: "mp3")!)

    
    var audioPlayer: AVAudioPlayer?
    
    var time = 61
    
    var timer = Timer()
  

    
    @IBOutlet weak var countdown: UILabel!
  

    @IBOutlet weak var wordsTable: UITableView!
   
    @IBOutlet weak var score: UILabel!
    
    
    @IBOutlet weak var userInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let fileWords = Bundle.main.path(forResource: "words", ofType: "txt")
        

        
        do{
            
            
            let readWords = try String(contentsOfFile: fileWords!, encoding: String.Encoding.utf8)
            
            let readings = readWords.components(separatedBy: "\n")
            
            for i in 1..<readings.count{
            
                words.append(readings[i])
            
            
            }
            
            
            
            
            
        }catch let error as NSError{
            print("Failed to read file")
            print(error)
            
            
            
        }
        
//
        
 
        words.shuffle()
        
        userInput.delegate = self
        
        //responsible for moving the screen up for keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)

    }
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//
//        user.shake()
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier=="endGame"){
        let sendScore = segue.destination as! EndGame
     
        //sends score to Endgame
        
                sendScore.receivedScore = score.text!
                
        }
    }



    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        
        return words.count
        
    }
    
    
    func timeToMoveOn() {
        self.performSegue(withIdentifier: "endGame", sender: self)
    }

    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        cell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell?.textLabel?.text=words[indexPath.row]
       
        
        return cell!
        
        
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
      
        
        timer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
        
        timer = Timer.scheduledTimer(timeInterval: 61.0, target: self, selector: #selector(timeToMoveOn), userInfo: nil, repeats: false)
        
        
    }
 
    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }

    func performAction() {
    
        
        var text = "";
        text=userInput.text!
        
        
        

        
        if(text==words.first){
            
            count=count+1;
            score.text = String(count)
            userInput.text="";
            words.removeFirst()
           

            wordsTable.reloadData()
            do{
                
                try
                    audioPlayer = AVAudioPlayer(contentsOf:self.correctSound)
                audioPlayer!.play()
                
            }
            catch{
                
                print("Did not find sound file!")
                
            }
            
            
        }
        else{
        
            do{
                
                try
                    audioPlayer = AVAudioPlayer(contentsOf:self.wrongSound)
                audioPlayer!.play()
                
            }
            catch{
                
                print("Did not find sound file!")
                
            }
        
        }
    
    }
    


    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
       
        if(textField==userInput){
        performAction()
        
        }

        
        //user.resignFirstResponder()  //if desired
        
        return true
    }
    
    @IBAction func menu(_ sender: Any) {
        
        timer.invalidate()
        time=60
        score.text="0"
        countdown.text=String(time)
        timer = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(timeToMoveOn), userInfo: nil, repeats: false)

        
        
    }
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
//    {
//        
//      
//
//        
//        if(userInput.text==words.first){
//            
//            count=count+1
//            score.text = String(count)
//            userInput.text=nil
//            words.removeFirst()
//            
//            
//            wordsTable.reloadData()
//            do{
//                
//                try
//                
//                audioPlayer = AVAudioPlayer(contentsOf:self.correctSound)
//                audioPlayer!.play()
//                
//            }
//            catch{
//                
//                print("Did not find sound file!")
//                
//            }
//            
//            
//        }
//        else {
//            return false
//        }
//        else{
//            
//            do{
//                
//                try
//                    audioPlayer = AVAudioPlayer(contentsOf:self.wrongSound)
//                audioPlayer!.play()
//                
//            }
//            catch{
//                
//                print("Did not find sound file!")
//                
//            }
//            
//        }

//        return true
//        
//        
//    }

    func action(){
    
        time -= 1
        
        countdown.text = String(time)
        
    }
  


}
extension MutableCollection where Indices.Iterator.Element == Index {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled , unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            let d: IndexDistance = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            guard d != 0 else { continue }
            let i = index(firstUnshuffled, offsetBy: d)
            swap(&self[firstUnshuffled], &self[i])
        }
    }
}

extension Sequence {
    /// Returns an array with the contents of this sequence, shuffled.
    func shuffled() -> [Iterator.Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}
