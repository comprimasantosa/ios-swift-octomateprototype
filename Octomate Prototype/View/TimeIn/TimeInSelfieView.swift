//
//  TimeInSelfieView.swift
//  Octomate Prototype
//
//  Created by Prima Santosa on 19/05/21.
//

import SwiftUI

struct TimeInSelfieView: View {
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    ZStack {
      VStack {
        Image("PlaceholderPortrait")
          .resizable()
        HStack {
          Spacer(minLength: 180)
          
          Image(systemName: "largecircle.fill.circle")
            .resizable()
            .frame(width: 72, height: 72, alignment: .center)
            .foregroundColor(.white)
          
          Spacer()
          
          NavigationLink(
            destination:
              TimeInLocationView(locationService: LocationService()
            ),
            label: {
              Text("Next")
                .font(Font.custom("NunitoSans-Regular", size: 18))
                .foregroundColor(.white)
                .padding(.horizontal, 42)
            })
        }
        .padding(.top, 16)
        .padding(.bottom, 32)
      }
      .background(Color.black)
      
      VStack(alignment: .leading) {
        Spacer()
        
        HStack {
          Image("PlaceholderPortrait")
            .resizable()
            .frame(width: 120, height: 170)
            .cornerRadius(8.0)
            .border(Color.white, width: 1)
          
          Spacer()
        }
      }
      .padding(.bottom, 72)
      .padding(.leading, 32)
    }
    .navigationTitle("Time In")
    .navigationBarTitleDisplayMode(.inline)
    .navigationBarBackButtonHidden(true)
    .navigationBarItems(
      leading: Button(
        action: {
          self.presentationMode.wrappedValue.dismiss()
        },
        label: {
      Image(systemName: "arrow.backward")
    }))
    .edgesIgnoringSafeArea(.bottom)
  }
}

struct TimeInSelfieView_Previews: PreviewProvider {
  static var previews: some View {
    TimeInSelfieView()
  }
}
