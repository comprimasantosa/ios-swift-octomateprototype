//
//  OctoDataSource.swift
//  Octomate Prototype
//
//  Created by Prima Santosa on 21/05/21.
//

import Foundation
import Combine
import Alamofire

protocol OctoDataSourceProtocol {
  func postLogin(
    body: [String: String]
  ) -> AnyPublisher<[LoginResponse], Error>
}

final class OctoDataSource: OctoDataSourceProtocol {
  private init() {}
  static let shared = OctoDataSource()

  func postLogin(body: [String: String]) -> AnyPublisher<[LoginResponse], Error> {
    return Future<[LoginResponse], Error> { completion in
      AF.request(URL.login(), method: .post, parameters: body, encoding: JSONEncoding.default, headers: ["Content-Type": "application/json"])
        .validate()
        .responseDecodable(of: [LoginResponse].self) { response in
          switch response.result {
          case .success(let value):
            completion(.success(value))
          case .failure(let error):
            completion(.failure(error))
          }
        }
    }
    .eraseToAnyPublisher()
  }
}
