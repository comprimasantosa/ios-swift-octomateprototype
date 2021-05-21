//
//  TimeInLocationView.swift
//  Octomate Prototype
//
//  Created by Prima Santosa on 20/05/21.
//

import SwiftUI
import GoogleMaps

struct TimeInLocationView: View {
  @Environment(\.presentationMode) var presentationMode
  @StateObject var locationService: LocationService
  @State var isDialogTimeInOpen = false
  
  var body: some View {
    GeometryReader { reader in
      ZStack {
        VStack {
          HStack {
            Text("Current location, accuracy \(Int(locationService.accuracy)) meter(s)")
              .font(Font.custom("NunitoSans-Bold", size: 14))
              .foregroundColor(.black)
          }
          .frame(width: reader.size.width, height: 50, alignment: .center)
          .background(
            Color(UIColor(red: 0.93, green: 0.97, blue: 0.97, alpha: 1.00))
          )
          .padding(.bottom, -8)
          .padding(.top, -2)
          
          MapView()
            .frame(height: 300, alignment: .center)
          
          Text("\(locationService.locationName)")
            .modifier(SectionTitleLabel())
            .padding(.top, 16)
            .padding(.bottom, 4)
            .padding(.horizontal, 16)
          
          TimerView()
          
          Button(action: {
            self.isDialogTimeInOpen.toggle()
          }, label: {
            Text("Confirm Time In")
          })
          .buttonStyle(GreenWideButton())
          
          HStack {
            Text("Not Correct?")
              .font(Font.custom("NunitoSans-Bold", size: 14))
              .foregroundColor(
                Color(UIColor(red: 0.65, green: 0.65, blue: 0.65, alpha: 1.00))
              )
              .padding(.top, 12)
            
            Button(
              action: {
                locationService.updateLocation()
              },
              label: {
                Text("Recapture Location")
                  .font(Font.custom("NunitoSans-Bold", size: 14))
                  .foregroundColor(
                    Color(UIColor(red: 0.65, green: 0.65, blue: 0.65, alpha: 1.00))
                  )
                  .underline()
                  .padding(.top, 12)
              }
            )
            .buttonStyle(PlainButtonStyle())
          }
          
          Spacer()
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
            }
          )
        )
      }
      if isDialogTimeInOpen {
        VStack {
          Spacer()
          HStack {
            Spacer()
            DialogTimeInView()
              .frame(width: reader.size.width - 100)
            Spacer()
          }
          Spacer()
        }
      }
    }
  }
}

struct TimeInLocationView_Previews: PreviewProvider {
  static var previews: some View {
    TimeInLocationView(locationService: LocationService())
  }
}




