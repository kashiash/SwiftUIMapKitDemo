//
//  ContentView.swift
//  SwiftUIMapKitDemo
//
//  Created by Jacek Kosinski U on 13/08/2023.
//



import SwiftUI
import MapKit


extension CLLocationCoordinate2D {
    static let palacKultury = CLLocationCoordinate2D(latitude: 52.2297, longitude: 21.0115)
    static let kaczeBagno = CLLocationCoordinate2D(latitude: 52.220306, longitude: 21.017890)
    static let pickupLocation = CLLocationCoordinate2D(latitude: 52.250556, longitude: 21.012222)
}

struct ContentView: View {
    @State private var position: MapCameraPosition = .automatic

    var body: some View {
        Map(position: $position)
        {
//            Marker("Pickup here",
//                            systemImage: "car.front.waves.up",
//                            coordinate: .pickupLocation)
//                            .tint(.purple)

            Annotation("Odbiór", coordinate: .pickupLocation, anchor: .bottom) {
                Image(systemName: "car.front.waves.up")
            }
        }
               .onAppear {
//                   position = .item(MKMapItem(placemark: .init(coordinate: .palacKultury)))

                   position = .camera(MapCamera(
                                      centerCoordinate: .palacKultury,
                                      distance: 800,
                                      heading: 90,
                                      pitch: 50))
               }
               .safeAreaInset(edge: .bottom) {
                   HStack {
                       Button(action: {
                           withAnimation {
                               position = .item(MKMapItem(placemark: .init(coordinate: .palacKultury)))
                           }
                       }) {
                           Text("Pajac kultury")
                       }
                       .tint(.black)
                       .buttonStyle(.borderedProminent)

                       Button(action: {
                           withAnimation {
                               position = .item(MKMapItem(placemark: .init(coordinate: .kaczeBagno)))
                           }
                       }) {
                           Text("Kacze bagno")
                       }
                       .tint(.black)
                       .buttonStyle(.borderedProminent)

                       Button(action: {
                           withAnimation {
                               position = .item(MKMapItem(placemark: .init(coordinate: .pickupLocation)))
                           }
                       }) {
                           Text("Pickup")
                       }
                       .tint(.black)
                       .buttonStyle(.borderedProminent)
                   }
               }
       }
}
#Preview {
    ContentView()
}
