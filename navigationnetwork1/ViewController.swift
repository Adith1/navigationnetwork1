//
//  ViewController.swift
//  navigationnetwork1
//
//  Created by Adith Sundram on 5/25/19.
//  Copyright © 2019 Adith Sundram. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    @IBOutlet weak var Button4: UIButton!
    @IBOutlet weak var Button5: UIButton!
    @IBOutlet weak var Button6: UIButton!
    @IBOutlet weak var Button7: UIButton!
    @IBOutlet weak var Button8: UIButton!
    @IBOutlet weak var Button9: UIButton!
    @IBOutlet weak var Button10: UIButton!
    @IBOutlet weak var Button11: UIButton!
    @IBOutlet weak var Button12: UIButton!
    @IBOutlet weak var Button13: UIButton!
    @IBOutlet weak var Button14: UIButton!
    @IBOutlet weak var Button15: UIButton!
    @IBOutlet weak var Button16: UIButton!
    @IBOutlet weak var Button17: UIButton!
    @IBOutlet weak var Button18: UIButton!
    @IBOutlet weak var Button19: UIButton!
    @IBOutlet weak var Button20: UIButton!
    @IBOutlet weak var Button21: UIButton!
    @IBOutlet weak var Button22: UIButton!
    @IBOutlet weak var Button23: UIButton!
    @IBOutlet weak var Button24: UIButton!
    @IBOutlet weak var map: MKMapView!
        
    let locationManager = CLLocationManager()

    var image = UIImage(named: "empty")
    var parkingSpot = false
    var tagger = 0
    
    @IBAction func Button1(_ sender: UIButton) {
        if parkingSpot == false{
            image = sender.currentBackgroundImage
            if image == UIImage(named: "empty"){
                sender.setBackgroundImage(UIImage(named: "car"), for: UIControl.State.normal)
                tagger = sender.tag
                parkingSpot = true
            }
        }else{
            if(sender.tag == tagger){
                sender.setBackgroundImage(UIImage(named: "empty"), for: UIControl.State.normal)
                parkingSpot = false
            }
        }
    }
    let regionRadius: CLLocationDistance = 300
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
            map.setRegion(coordinateRegion, animated: true)
        }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0 {
            centerMapOnLocation(location: location)
            locationManager.stopUpdatingLocation()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        map.showsUserLocation = true
        map.isUserInteractionEnabled = false
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }


}

