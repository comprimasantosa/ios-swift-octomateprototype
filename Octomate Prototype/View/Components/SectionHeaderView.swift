//
//  SectionHeaderView.swift
//  Octomate Prototype
//
//  Created by Prima Santosa on 19/05/21.
//

import SwiftUI

struct SectionHeaderView: View {
  let image: String
  let title: String
  let showTrailingButton: Bool
  
  var body: some View {
    HStack {
      ZStack {
        Image(systemName: image)
          .resizable()
          .frame(width: 12, height: 12, alignment: .center)
          .foregroundColor(.gray)
      }
      .padding(.all, 4)
      .background(Color.white)
      .clipShape(Circle())
      
      Text(title)
        .modifier(SectionTitleLabel())
      
      Spacer()
      
      if showTrailingButton {
        Button(
          action: {},
          label: {
            Text("View All")
          }
        )
        .buttonStyle(PlainGreenButton())
        
      }
    }
    .padding(.vertical, 8)
    .padding(.horizontal, 16)
  }
}


