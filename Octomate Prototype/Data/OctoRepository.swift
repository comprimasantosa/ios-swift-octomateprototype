//
//  OctoRepository.swift
//  Octomate Prototype
//
//  Created by Prima Santosa on 21/05/21.
//

import Foundation
import Combine

protocol OctoRepositoryProtocol {
  func postLogin(
    body: [String: String]
  ) -> AnyPublisher<Login, Error>
}

final class OctoRepository: OctoRepositoryProtocol {
  fileprivate var octoDataSource: OctoDataSource
  
  init(octoDataSource: OctoDataSource) {
    self.octoDataSource = octoDataSource
  }
  
  static let shared = OctoRepository(octoDataSource: OctoDataSource.shared)
  
  func postLogin(body: [String : String]) -> AnyPublisher<Login, Error> {
    return self.octoDataSource.postLogin(body: body)
      .map {
        OctoMapper.mapLoginResponseToLogin(from: $0)
      }.eraseToAnyPublisher()
  }
}
