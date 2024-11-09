//
//  City.swift
//  Guidebook
//
//  Created by Antony Holshouser on 11/9/24.
//

import Foundation

struct City: Identifiable {
    var id = UUID()
    
    var name: String
    var summary: String
    var imageName: String
    
    var attractions: [Attraction]
}
