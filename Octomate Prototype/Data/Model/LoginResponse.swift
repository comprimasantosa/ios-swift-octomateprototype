//
//  LoginResponse.swift
//  Octomate Prototype
//
//  Created by Prima Santosa on 21/05/21.
//

import Foundation

struct LoginResponse: Codable {
  enum CodingKeys: String, CodingKey {
    case associateData = "associateData"
  }
  
  let associateData: LoginDataResponse?
}

struct LoginDataResponse: Codable {
  enum CodingKeys: String, CodingKey {
    case name = "name"
  }
  
  let name: String?
}
