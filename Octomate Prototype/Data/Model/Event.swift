//
//  Event.swift
//  Octomate Prototype
//
//  Created by Prima Santosa on 21/05/21.
//

import Foundation

struct Event: Identifiable {
  let id = UUID().uuidString
  let title: String
  let tag: String
  var isEditable: Bool = false
  let timeFrom: String
  let timeTo: String
  let totalHours: String
  let totalBreak: String
}
