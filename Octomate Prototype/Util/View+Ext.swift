//
//  View+Ext.swift
//  Octomate Prototype
//
//  Created by Prima Santosa on 19/05/21.
//

import UIKit
import SwiftUI

extension View {
  func navigationBarColor(backgroundColor: UIColor, tintColor: UIColor, inlineTitleFont: UIFont) -> some View {
    self.modifier(
      NavigationBarColor(
        backgroundColor: backgroundColor,
        tintColor: tintColor,
        inlineTitleFont: inlineTitleFont
      )
    )
  }
  
  func underlineTextField() -> some View {
    self
      .overlay(Rectangle().frame(height: 1).padding(.top, 40))
      .foregroundColor(.white)
  }
}
