//
//  Announcement.swift
//  Octomate Prototype
//
//  Created by Prima Santosa on 21/05/21.
//

import Foundation

struct Announcement: Identifiable {
  let id = UUID().uuidString
  let title: String
  let subtitle: String
  let body: String
  let tag: String
  let date: String
}
