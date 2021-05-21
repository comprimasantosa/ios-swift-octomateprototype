//
//  Mapper.swift
//  Octomate Prototype
//
//  Created by Prima Santosa on 21/05/21.
//

import Foundation

final class OctoMapper {
  static func mapLoginResponseToLogin(from response: [LoginResponse]) -> Login {
    return Login(name: response[0].associateData?.name ?? "Unknown name")
  }
}
