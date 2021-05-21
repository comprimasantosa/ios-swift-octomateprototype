//
//  LocationService.swift
//  Octomate Prototype
//
//  Created by Prima Santosa on 20/05/21.
//

import Foundation
import CoreLocation

class LocationService: NSObject, ObservableObject {
  private let locationManager = CLLocationManager()
  @Published var location: CLLocation = CLLocation()
  @Published var latitude: Double = 0
  @Published var longitude: Double = 0
  @Published var accuracy: Double = 0
  @Published var locationName: String = ""
  
  override init() {
    super.init()
    updateLocation()
  }
  
  func updateLocationName(location: CLLocation) {
    let geocoder = CLGeocoder()
    geocoder.reverseGeocodeLocation(location) { placemarks, error in
      if error == nil && placemarks?.count ?? 0 > 0 {
        self.locationName = "\(placemarks?.last?.name ?? ""), \(placemarks?.last?.locality ?? ""), \(placemarks?.last?.country ?? "")"
      }
    }
  }
  
  func updateLocation() {
    resetLocation()
    self.locationManager.delegate = self
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
    self.locationManager.requestWhenInUseAuthorization()
    self.locationManager.startUpdatingLocation()
  }
  
  private func resetLocation() {
    self.latitude = 0
    self.longitude = 0
  }
}
  
extension LocationService: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.last else { return }
    self.location = location
    latitude = location.coordinate.latitude
    longitude = location.coordinate.longitude
    accuracy = location.horizontalAccuracy
    updateLocationName(location: location)
  }
}
