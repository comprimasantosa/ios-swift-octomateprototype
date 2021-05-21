//
//  Constants.swift
//  Octomate Prototype
//
//  Created by Prima Santosa on 19/05/21.
//

import UIKit
import SwiftUI

struct Constants {
  static let colorPrimaryDark = UIColor(red: 0.38, green: 0.65, blue: 0.64, alpha: 1.00)
  static let colorPrimary = UIColor(red: 0.56, green: 0.81, blue: 0.79, alpha: 1.00)
  static let navigationTitleColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
  static let inlineTitleFont = UIFont(name: "NunitoSans-Bold", size: 18)!
  static let mapZoomLevel: Float = 16.0
  static let drawerTopMenuItems = [
    "Home",
    "Profile",
    "Assignments",
    "Timesheet",
    "Claims",
    "Leave",
    "Roster",
    "Payslip",
    "Settings"
  ]
  static let drawerTopMenuIcons = [
    "house.fill",
    "person.fill",
    "doc.fill",
    "calendar",
    "checkmark.shield.fill",
    "arrow.right.doc.on.clipboard",
    "list.bullet.rectangle",
    "doc.text",
    "gearshape"
  ]
  static let drawerTopMenuDestination: [AnyView] = [
    AnyView(Text("Not implemented")),
    AnyView(ProfileView()),
    AnyView(Text("Not implemented")),
    AnyView(TimesheetView()),
    AnyView(Text("Not implemented")),
    AnyView(Text("Not implemented")),
    AnyView(Text("Not implemented")),
    AnyView(Text("Not implemented")),
    AnyView(Text("Not implemented"))
  ]
}
