//
//  MapView.swift
//  Octomate Prototype
//
//  Created by Prima Santosa on 20/05/21.
//

import SwiftUI
import GoogleMaps

struct MapView: UIViewRepresentable {
  @ObservedObject var locationService = LocationService()
  private let marker = GMSMarker()
  
  func makeUIView(context: Context) -> GMSMapView {
    let currentLocation = CLLocationCoordinate2D(latitude: locationService.latitude, longitude: locationService.longitude)
    let camera = GMSCameraPosition.camera(withLatitude: locationService.latitude, longitude: locationService.longitude, zoom: Constants.mapZoomLevel)
    let mapView = GMSMapView(frame: CGRect.zero, camera: camera)
    updateMarker(marker: marker, mapView: mapView, location: currentLocation)
    return mapView
  }
  
  func updateUIView(_ mapView: GMSMapView, context: Context) {
    let currentLocation = CLLocationCoordinate2D(latitude: locationService.latitude, longitude: locationService.longitude)
    mapView.animate(toLocation: currentLocation)
    updateMarker(marker: marker, mapView: mapView, location: currentLocation)
  }
  
  private func updateMarker(marker: GMSMarker, mapView: GMSMapView, location: CLLocationCoordinate2D) {
    marker.position = location
    marker.title = "Current Position"
    marker.map = mapView
  }
}
