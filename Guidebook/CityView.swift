//
//  ContentView.swift
//  Guidebook
//
//  Created by Antony Holshouser on 11/9/24.
//

import SwiftUI

struct CityView: View {
    @State var cities = [City]()
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(cities) { city in
                        NavigationLink {
                            AttractionView(city: city)
                        } label: {
                            CityCard(city: city)
                                .padding(.bottom)
                        }
                        
                    }
                }
            }
            .scrollIndicators(.hidden)
            .padding(.horizontal)
        }
        .onAppear() {
            cities = DataService().getData()
        }
    }
}

#Preview {
    CityView()
}
