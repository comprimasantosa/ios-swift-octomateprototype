//
//  Reminder.swift
//  Octomate Prototype
//
//  Created by Prima Santosa on 21/05/21.
//

import Foundation

struct Reminder: Identifiable {
  let id = UUID().uuidString
  let title: String
  let placement: String
  let dateFrom: String
  let dateTo: String
}
