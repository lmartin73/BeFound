//
//  ViewController.swift
//  BeFound
//
//  Created by dev on 4/19/17.
//  Copyright © 2017 dev. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    let shelters = Shelter.getShelters()
    let TABLE_SECTION_COUNT = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestLocationAccess()
        addAnnotations()
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return TABLE_SECTION_COUNT
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shelters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableview.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = shelters[indexPath.row].title
        cell?.detailTextLabel?.text = shelters[indexPath.row].hours
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableview.deselectRow(at: indexPath, animated: true)
        let modal = self.storyboard?.instantiateViewController(withIdentifier: "ModalViewController") as! ModalViewController
        modal.shelter = shelters[indexPath.row]
        modal.modalPresentationStyle = .overCurrentContext
        present(modal, animated: true, completion: nil)
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
    
    func addAnnotations() {
        mapView?.delegate = self
        mapView?.addAnnotations(shelters)
        
        let overlays = shelters.map { MKCircle(center: $0.coordinate, radius: 100) }
        mapView?.addOverlays(overlays)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        } else {
            let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "annotationView") ?? MKAnnotationView()
            annotationView.image = UIImage(named: "place icon")
            return annotationView
        }
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKCircleRenderer(overlay: overlay)
        renderer.fillColor = UIColor.black.withAlphaComponent(0.5)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 2
        return renderer
    }

}

