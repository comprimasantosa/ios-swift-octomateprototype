//
//  ProfileHeaderView.swift
//  Octomate Prototype
//
//  Created by Prima Santosa on 21/05/21.
//

import SwiftUI

struct ProfileHeaderView: View {
  let name: String
  
  var body: some View {
    VStack {
      HStack {
        Image("PlaceholderUserImage")
          .resizable()
          .frame(width: 84, height: 84, alignment: .center)
          .clipShape(Circle())
        
        VStack(alignment: .leading) {
          Text("\(name)")
          
          NavigationLink(
            destination: TimeInSelfieView(),
            label: {
              Text("Clock In")
            }
          )
          .buttonStyle(WhiteButton())
        }
        .padding(.horizontal, 12)
        
        Spacer()
      }
    }
    .padding(.all)
    .background(
      Color(
        UIColor(red: 0.81, green: 0.91, blue: 0.91, alpha: 1.00)
      )
    )
  }
}

struct ProfileHeaderView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileHeaderView(name: "Matthew")
  }
}

