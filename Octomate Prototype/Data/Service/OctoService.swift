//
//  OctoService.swift
//  Octomate Prototype
//
//  Created by Prima Santosa on 21/05/21.
//

import Foundation

private extension URL {
  static func makeEndpoint(_ endpoint: String) -> URL {
    URL(string: "\(URL.baseUrl)\(endpoint)")!
  }
}

extension URL {
  private static var baseUrl: String {
    guard let filePath = Bundle.main.path(forResource: "Octomate-Info", ofType: "plist") else {
      fatalError("Couldn't find file 'Octomate-Info.plist'.")
    }
    let plist = NSDictionary(contentsOfFile: filePath)
    guard let value = plist?.object(forKey: "BASE_URL") as? String else {
      fatalError("Couldn't find key 'BASE_URL' in 'Octomate-Info.plist'.")
    }
    return value
  }
  
  static func login() -> URL {
    makeEndpoint("login/email")
  }
}
