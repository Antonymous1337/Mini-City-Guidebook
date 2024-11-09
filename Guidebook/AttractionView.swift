//
//  AttractionView.swift
//  Guidebook
//
//  Created by Antony Holshouser on 11/9/24.
//

import SwiftUI

struct AttractionView: View {
    var city: City
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach (city.attractions) { attraction in
                        NavigationLink {
                            DetailView(attraction: attraction)
                        } label: {
                            AttractionRow(attraction: attraction)
                                .padding(.bottom, 50)
                        }
                        .buttonStyle(.plain)
                        
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .padding(.horizontal)
    }
}

#Preview {
    AttractionView(city: City(name: "1", summary: "2", imageName: "3", attractions: [Attraction(name: "4", summary: "5", longDescription: "6", imageName: "7", latLong: "8")]))
}
