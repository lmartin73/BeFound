//
//  Shelters.swift
//  BeFound
//
//  Created by Jordan Hubbard on 4/20/17.
//  Copyright © 2017 dev. All rights reserved.
//

import Foundation
import MapKit

@objc class Shelter: NSObject {
    var title: String?
    var phone: String?
    var coordinate: CLLocationCoordinate2D
    var hours: String?
    var street1: String?
    var city: String?
    
    init(title: String?, phone: String?, coordinate: CLLocationCoordinate2D, hours: String?, street1: String?, city: String?) {
        self.title = title
        self.phone = phone
        self.coordinate = coordinate
        self.hours = hours
        self.street1 = street1
        self.city = city
    }
    
    static func getShelters() -> [Shelter] {
        guard let path = Bundle.main.path(forResource: "ShelterCoding", ofType: "plist"), let array = NSArray(contentsOfFile: path) else { return [] }
        
        var shelters = [Shelter]()
        
        for item in array {
            let dictionary = item as? [String : Any]
            let title = dictionary?["title"] as? String
            let phone = dictionary?["phone"] as? String
            let latitude = dictionary?["latitude"] as? Double ?? 0, longitude = dictionary?["longitude"] as? Double ?? 0
            let hours = dictionary?["hours"] as? String
            let street1 = dictionary?["street1"] as? String
            let city = dictionary?["city"] as? String
            
            let curr_shelter = Shelter(title: title, phone: phone, coordinate: CLLocationCoordinate2DMake(latitude, longitude), hours: hours, street1: street1, city: city)
            shelters.append(curr_shelter)
        }
        
        return shelters as [Shelter]
    }
}

extension Shelter: MKAnnotation { }
