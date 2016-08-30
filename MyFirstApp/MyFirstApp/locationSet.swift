//
//  locationSet.swift
//  MyFirstApp
//
//  Created by Rishi Masand on 10/13/15.
//  Copyright (c) 2015 Rishi Masand. All rights reserved.
//

import UIKit
import CoreLocation

class locationSetViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    
    var theCity: String = ""
    
    @IBOutlet var cityTextField: UITextField!
    @IBOutlet var cityLabel: UILabel!
    
    var userLocation: CLLocation = CLLocation()
    
    override func viewDidLoad() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.distanceFilter = 1
        locationManager.startUpdatingLocation()
        
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        var location: AnyObject? = locations.last
        
        if let location: AnyObject = location {
            var loc = location as! CLLocation
            userLocation = loc
            getPlacemarkFromLocation(loc)
        }
        
    }
    
    func getPlacemarkFromLocation(location: CLLocation){
        CLGeocoder().reverseGeocodeLocation(location, completionHandler:
            {(placemarks, error) in
                
                if ((error) != nil) {
                    println(error.localizedDescription)
                }
                
                else {
                    let pm = placemarks as! [CLPlacemark]
                    if pm.count > 0 {
                        var tempPM: CLPlacemark = placemarks[0] as! CLPlacemark
                        self.theCity = tempPM.locality as String
                    }
                }
                
               
        })
    }
    
    @IBAction func citySubmit(sender: AnyObject) {
        self.cityLabel.text = self.cityTextField.text
        println(theCity)
        self.performSegueWithIdentifier("toGetData", sender: nil)
    }
    
}
