//
//  DetailView.swift
//  Guidebook
//
//  Created by Antony Holshouser on 11/9/24.
//

import SwiftUI

struct DetailView: View {
    var attraction: Attraction
    var body: some View {
        VStack(spacing: 20) {
            Image(attraction.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 300)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text(attraction.name)
                        .font(.title)
                        .bold()
                    Text(attraction.longDescription)
                        .multilineTextAlignment(.leading)
                    
                    if let url = URL(string: "maps://?q=\(cleanName(name:attraction.name))&sll=\(cleanCoords(coords:attraction.latLong))&z=1&t=s") {
                        
                        if UIApplication.shared.canOpenURL(url) {
                            
                            Button {
                                UIApplication.shared.open(url)
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundStyle(.blue)
                                        .frame(height: 40)
                                    Text("Get Directions")
                                        .foregroundStyle(.white)
                                }
                            }
                        }
                        
                    }
                }
                .padding(.bottom, 20)
            }
            .padding(.horizontal)
            .scrollIndicators(.hidden)
        }
        .ignoresSafeArea()
    }
    
    func cleanName(name: String) -> String {
        return name.replacingOccurrences(of: " ", with: "+").folding(options: .diacriticInsensitive, locale: .current)
    }
    
    func cleanCoords(coords: String) -> String {
        return coords.replacingOccurrences(of: " ", with: "")
    }
    
}

#Preview {
    DetailView(attraction: Attraction(name: "Buckingham Palace",
                                      summary: "Buckingham Palace is a London royal residence and the administrative headquarters of the monarch of the United Kingdom. Located in the City of Westminster, the palace is often at the centre of state occasions and royal hospitality.",
                                      longDescription: """
   Buckingham Palace is a London royal residence and the administrative headquarters of the monarch of the United Kingdom. Located in the City of Westminster, the palace is often at the centre of state occasions and royal hospitality. It has been a focal point for the British people at times of national rejoicing and mourning.


   Originally known as Buckingham House, the building at the core of today's palace was a large townhouse built for the Duke of Buckingham in 1703 on a site that had been in private ownership for at least 150 years. It was acquired by King George III in 1761 as a private residence for Queen Charlotte and became known as The Queen's House. During the 19th century it was enlarged by architects John Nash and Edward Blore, who constructed three wings around a central courtyard. Buckingham Palace became the London residence of the British monarch on the accession of Queen Victoria in 1837.
   """,
                                      imageName: "buckingham", latLong: "51.50148418749087, -0.1410746109020975"))
}
