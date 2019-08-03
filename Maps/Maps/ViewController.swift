//
//  ViewController.swift
//  Maps
//
//  Created by Harsh Patel on 4/3/17.
//  Copyright © 2017 Harsh Patel. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.requestWhenInUseAuthorization()
        mapView.showsUserLocation=true
        mapView.delegate=self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func zoomIn(_ sender: Any) {
        
        let userLocation=mapView.userLocation
        let region = MKCoordinateRegionMakeWithDistance(userLocation.location!.coordinate, 2000, 2000)
        
        mapView.setRegion(region, animated: true)
        
        
        
    }
    
    
    @IBAction func changeMapType(_ sender: Any) {
        
        if(mapView.mapType==MKMapType.standard){
        
        mapView.mapType=MKMapType.satellite
        
        
        }
        else{mapView.mapType=MKMapType.standard}
        
        
    }
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        mapView.centerCoordinate=userLocation.location!.coordinate
    }
}

