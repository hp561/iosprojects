//
//  ViewController.swift
//  Location
//
//  Created by Harsh Patel on 4/3/17.
//  Copyright © 2017 Harsh Patel. All rights reserved.
//

import UIKit
import CoreLocation



class ViewController: UIViewController, CLLocationManagerDelegate{
    
    
    @IBOutlet weak var currLatt: UILabel!
    @IBOutlet weak var currLong: UILabel!
    @IBOutlet weak var horizontalAcc: UILabel!
    @IBOutlet weak var currAlt: UILabel!
    @IBOutlet weak var verticalAcc: UILabel!
    @IBOutlet weak var distance: UILabel!
    
    
    var locationManager: CLLocationManager = CLLocationManager()

    var startLocation: CLLocation!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        locationManager.desiredAccuracy=kCLLocationAccuracyBest
        locationManager.delegate=self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        startLocation = nil
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let latestLocation = locations[locations.count-1]
        currLatt.text = String(latestLocation.coordinate.latitude)
        currLong.text = String(latestLocation.coordinate.longitude)
        horizontalAcc.text = String(latestLocation.horizontalAccuracy)
        currAlt.text = String(latestLocation.altitude)
        verticalAcc.text = String(latestLocation.verticalAccuracy)
        
        if(startLocation==nil){
        
        startLocation=latestLocation
        
        
        }
        distance.text = String (latestLocation.distance(from: startLocation))
        
    }
    
    @IBAction func resetDistance(_ sender: Any) {
        
        startLocation=nil
    }
    
}

