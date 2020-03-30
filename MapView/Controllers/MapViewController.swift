//
//  MapViewController.swift
//  MapView
//
//  Created by Cacttus Education 09 on 3/30/20.
//  Copyright © 2020 Cacttus Education. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate {

 var locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addAnnotationOnMap()
        getUserLocation()
    }
    
    let locations = [
        ["title": "Rruga Hekurudhat", "latitude": 42.654780, "longitude": 21.147394],
        ["title": "Ndertesa Komunes", "latitude": 42.656939, "longitude": 21.144791],
        ["title": "Essior", "latitude": 42.658078, "longitude": 21.147647]
        ]
    
    
    func addAnnotationOnMap() {
        
        for location in locations {
            let annotation = MKPointAnnotation()
            annotation.title = location["title"] as? String
            annotation.coordinate = CLLocationCoordinate2D(latitude: location["latitude"] as! Double, longitude: location["longitude"] as! Double)
            mapView.addAnnotation(annotation)
        }
        
    }
        
    func setZoomAndRegion(regionCenter: CLLocationCoordinate2D){
            let coordinateRegion = MKCoordinateRegion(center: regionCenter, latitudinalMeters: 1000, longitudinalMeters: 1000)
            mapView.region = coordinateRegion
        }
        
        func getUserLocation() {
            locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
            
            if(CLLocationManager.locationServicesEnabled()){
                locationManager.delegate = self
                locationManager.startUpdatingLocation()
        }
            
            func locationManager( manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
                
                let myLocation = MKPointAnnotation()
                myLocation.title = "ME"
                myLocation.subtitle = "This is me!"
                myLocation.coordinate = CLLocationCoordinate2D(latitude: (manager.location?.coordinate.latitude)!, longitude: ( manager.location?.coordinate.longitude)!)
                }
            }
        }
