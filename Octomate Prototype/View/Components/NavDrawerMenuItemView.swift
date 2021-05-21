//
//  NavDrawerMenuItemView.swift
//  Octomate Prototype
//
//  Created by Prima Santosa on 20/05/21.
//

import SwiftUI

struct NavDrawerMenuItemView: View {
  let item: Int
  
  var body: some View {
    HStack {
      NavigationLink(
        destination: Constants.drawerTopMenuDestination[item],
        label: {
          Image(systemName: "\(Constants.drawerTopMenuIcons[item])")
            .frame(width: 23, height: 27, alignment: .center)
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color(Constants.colorPrimaryDark))
            .padding(.trailing, 8)
          Text("\(Constants.drawerTopMenuItems[item])")
          Spacer()
        }
      )
      .buttonStyle(PlainButtonStyle())
      .padding(.horizontal, 32)
      .padding(.vertical, 16)
    }
  }
}

struct NavDrawerMenuItemView_Previews: PreviewProvider {
  static var previews: some View {
    NavDrawerMenuItemView(item: 0)
  }
}
