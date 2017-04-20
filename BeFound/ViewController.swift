//
//  ViewController.swift
//  BeFound
//
//  Created by dev on 4/19/17.
//  Copyright © 2017 dev. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestLocationAccess(); 
        // Do any additional setup after loading the view, typically from a nib.
//        var point = MKPointAnnotation();
//        point.coordinate = CLLocationCoordinate2D(latitude: 32.462244, longitude: -90.186963)
//        point.title = "My Home";
//        
//        mapView.addAnnotation(point)
//        let regionRadius: CLLocationDistance = 1000
//        let coordinateRegion = MKCoordinateRegionMakeWithDistance(point.coordinate,
//                                                                  regionRadius * 2.0, regionRadius * 2.0)
//        mapView.setRegion(coordinateRegion, animated: true)
//        
    }
    
    func requestLocationAccess() {
        let status = CLLocationManager.authorizationStatus()
        
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            return
            
        case .denied, .restricted:
            print("location access denied")
            
        default:
            locationManager.requestWhenInUseAuthorization()
        }
    }
    


}

