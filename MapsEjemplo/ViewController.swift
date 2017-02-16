//
//  ViewController.swift
//  MapsEjemplo
//
//  Created by Lawrie Cate on 14/02/2017.
//  Copyright © 2017 LawrieCate. All rights reserved.
//  Basado en articulo de https://www.raywenderlich.com/90971/introduction-mapkit-swift-tutorial

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var mapa: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         mapa.delegate = self
        let initialLocation = CLLocation(latitude: 19.433333, longitude: -99.133333)
        centerMapOnLocation(location:initialLocation)
        
        navigationItem.title = "Eventos Cercanos"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   

    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                regionRadius * 20.0, regionRadius * 20.0)
        mapa.setRegion(coordinateRegion, animated: true)
        
        let fiesta1 = Fiesta(title: "Fiesta",
                             
                              coordinate: CLLocationCoordinate2D(latitude: 19.4072412, longitude: -99.1669262))
        
        mapa.addAnnotation(fiesta1)
    }
    
    
    // 1
    func mapView(_ mapView: MKMapView,
                 viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? Fiesta {
            let identifier = "fiestaPIN"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
                as? MKPinAnnotationView { // 2
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                // 3
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView
            }
            
            //view.pinTintColor = annotation.pinTintColor()
            return view
        }
        return nil
    }
    
    
    
     func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
      let fiesta = view.annotation as! Fiesta
     
     if control == view.rightCalloutAccessoryView {
        performSegue(withIdentifier: "mapFiestaDetail", sender: fiesta)
     }
     
    }
 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "mapFiestaDetail") {
            // pass data to next view
            if let destViewController = segue.destination as? FiestaViewController {
                let fiesta = sender as? Fiesta
                destViewController.fiesta=fiesta
                // = sender as? UIColor
               
            }
        }
    }

}

