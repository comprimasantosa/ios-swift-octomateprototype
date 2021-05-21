//
//  NavDrawerView.swift
//  Octomate Prototype
//
//  Created by Prima Santosa on 20/05/21.
//

import SwiftUI

struct NavDrawerView: View {
  let isOpen: Bool
  
  var body: some View {
    GeometryReader { reader in
      HStack {
        NavDrawerContentView()
          .frame(width: reader.size.width - 100)
          .offset(x: self.isOpen ? 0 : -reader.size.width )
          .animation(.default)
        Spacer()
      }
    }
    .edgesIgnoringSafeArea(.bottom)
  }
}

struct NavDrawerView_Previews: PreviewProvider {
  static var previews: some View {
    NavDrawerView(isOpen: true)
  }
}

