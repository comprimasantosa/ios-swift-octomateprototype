//
//  OctomatePrototypeApp.swift
//  Octomate Prototype
//
//  Created by Prima Santosa on 19/05/21.
//

import SwiftUI
import GoogleMaps
import AlamofireNetworkActivityLogger

@main
struct OctomatePrototypeApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
  
  var body: some Scene {
    WindowGroup {
      LoginView(viewModel: LoginViewModel(repository: OctoRepository.shared))
    }
  }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  private var apiKey: String {
    guard let filePath = Bundle.main.path(forResource: "Octomate-Info", ofType: "plist") else {
      fatalError("Couldn't find file 'Octomate-Info.plist'.")
    }
    let plist = NSDictionary(contentsOfFile: filePath)
    guard let value = plist?.object(forKey: "BASE_URL") as? String else {
      fatalError("Couldn't find key 'API_KEY' in 'Octomate-Info.plist'.")
    }
    return value
  }
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    GMSServices.provideAPIKey(apiKey)
    NetworkActivityLogger.shared.level = .debug
    NetworkActivityLogger.shared.startLogging()
    return true
  }
}
