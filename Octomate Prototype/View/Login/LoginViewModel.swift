//
//  LoginViewModel.swift
//  Octomate Prototype
//
//  Created by Prima Santosa on 21/05/21.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
  private var cancellables: Set<AnyCancellable> = []
  private let repository: OctoRepositoryProtocol
  @Published var name: String = ""
  @Published var errorMessage = ""
  @Published var isLoading = false
  
  init(repository: OctoRepositoryProtocol) {
    self.repository = repository
  }
  
  func login(body: [String: String]) {
    self.errorMessage = ""
    self.isLoading = true
    
    repository.postLogin(body: body)
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure:
          self.errorMessage = String(describing: completion)
          print(String(describing: completion))
          self.isLoading = false
        case .finished:
          self.isLoading = false
        }
      }, receiveValue: { results in
        self.name = results.name
        print(self.name)
      })
      .store(in: &cancellables)
  }
}
