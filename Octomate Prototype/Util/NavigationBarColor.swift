//
//  NavigationBarColor.swift
//  Octomate Prototype
//
//  Created by Prima Santosa on 19/05/21.
//

import SwiftUI
import UIKit

struct NavigationBarColor: ViewModifier {
  init(backgroundColor: UIColor, tintColor: UIColor, inlineTitleFont: UIFont) {
    let coloredAppearance = UINavigationBarAppearance()
    coloredAppearance.configureWithOpaqueBackground()
    coloredAppearance.backgroundColor = backgroundColor
    coloredAppearance.titleTextAttributes = [.foregroundColor: tintColor, .font: inlineTitleFont]
    coloredAppearance.largeTitleTextAttributes = [.foregroundColor: tintColor]
    
    UINavigationBar.appearance().standardAppearance = coloredAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    UINavigationBar.appearance().compactAppearance = coloredAppearance
    UINavigationBar.appearance().tintColor = tintColor
  }
  
  func body(content: Content) -> some View {
    content
  }
}
