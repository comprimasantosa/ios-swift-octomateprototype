//
//  CheckboxView.swift
//  Octomate Prototype
//
//  Created by Prima Santosa on 21/05/21.
//

import SwiftUI

struct CheckBoxView: View {
  @Binding var checked: Bool
  
  var body: some View {
    Image(systemName: checked ? "checkmark.square.fill" : "square")
      .foregroundColor(
        Color(UIColor(red: 0.87, green: 0.61, blue: 0.64, alpha: 1.00))
      )
      .onTapGesture {
        self.checked.toggle()
      }
  }
}
