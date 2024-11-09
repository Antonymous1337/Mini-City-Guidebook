//
//  Attraction.swift
//  Guidebook
//
//  Created by Antony Holshouser on 11/9/24.
//

import Foundation

struct Attraction: Identifiable {
    var id = UUID()
    
    var name: String
    var summary: String
    var longDescription: String
    var imageName: String
    var latLong: String
}
