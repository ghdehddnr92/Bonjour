//
//  MapViewController.swift
//  HelloTrip
//
//  Created by dong wook on 2017. 11. 22..
//  Copyright © 2017년 SSU. All rights reserved.
//

import UIKit
import MapKit
import GoogleMaps

class MapViewController: UIViewController {
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Convert address to coordinate and annotate it on map
//        let geoCoder = CLGeocoder()
//
//        geoCoder.geocodeAddressString("Korea", completionHandler:
//        {
//            placemarks, error in
//            if let error = error {
//                print(error)
//                return }
//            if let placemarks = placemarks { // Get the first placemark
//                let placemark = placemarks[0]
//                // Add annotation
//                let annotation = MKPointAnnotation()
//                if let location = placemark.location { annotation.coordinate = location.coordinate
//                    // Display the annotation
//                    self.mapView.showAnnotations([annotation], animated: true)
//                    self.mapView.selectAnnotation(annotation, animated: true)
//                } }
//        })
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func loadView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 46.227638, longitude: 2.213749000000007, zoom: 10.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
