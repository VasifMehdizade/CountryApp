//
//  MapController.swift
//  Country App
//
//  Created by Vasif Mehdi on 16.01.23.
//

import UIKit
import MapKit

class MapController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapview: MKMapView!
    
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()

        manager.delegate = self
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            
            let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            
            _ = MKCoordinateSpan(latitudeDelta: 100, longitudeDelta: 100)
            manager.stopUpdatingLocation()
            //            let region = MKCoordinateRegion(center: coordinate, span: span)
            let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: CLLocationDistance(100), longitudinalMeters: 10)
            
            mapview.setRegion(region, animated: true)
        }
    }
    


}
