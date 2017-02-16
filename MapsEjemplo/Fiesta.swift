
//
//  Fiesta.swift
//  MapsEjemplo
//
//  Created by Lawrie Cate on 14/02/2017.
//  Copyright © 2017 LawrieCate. All rights reserved.
//

import Foundation
import MapKit

class Fiesta: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return title
    }
}
