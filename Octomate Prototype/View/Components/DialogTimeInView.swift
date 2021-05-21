//
//  DialogTimeInView.swift
//  Octomate Prototype
//
//  Created by Prima Santosa on 21/05/21.
//

import SwiftUI

struct DialogTimeInView: View {
  @State private var remarks = ""
  @State private var isChecked = false
  private var dateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "hh:mm a, dd MMM yyyy"
    return formatter
  }
  
  var body: some View {
    VStack {
      Image(systemName: "checkmark.circle.fill")
        .resizable()
        .frame(width: 30, height: 30, alignment: .center)
        .foregroundColor(Color(Constants.colorPrimaryDark))
        .padding(.bottom, 8)
      
      Text("Time In Success")
        .font(Font.custom("NunitoSans-Bold", size: 16))
        .foregroundColor(.black)
      
      Text(Date(), formatter: dateFormatter)
        .font(Font.custom("NunitoSans-Bold", size: 14))
        .foregroundColor(
          Color(UIColor(red: 0.46, green: 0.46, blue: 0.46, alpha: 1.00))
        )
      
      VStack(alignment: .leading) {
        Text("Enter remarks below, if any")
          .font(Font.custom("NunitoSans-Bold", size: 16))
          .padding(.top, 8)
          .padding(.bottom, 4)
        
        ZStack {
          Color(UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.00))
          TextField("Type Remarks", text: $remarks)
            .padding(.all, 8)
        }
        .frame(width: 280, height: 100, alignment: .center)
        .cornerRadius(8.0)
      }
      
      HStack(alignment : .top) {
        CheckBoxView(checked: $isChecked)
        Text("Please tick this box if you have an approved extension from your manager or it will not be paid out")
          .font(Font.custom("NunitoSans-Bold", size: 16))
          .foregroundColor(
            Color(UIColor(red: 0.87, green: 0.61, blue: 0.64, alpha: 1.00))
          )
      }
      .padding(.top, 4)
      .padding(.bottom, 16)
      
      Divider()
      
      HStack {
        NavigationLink(
          destination: ProfileView(),
          label: {
            Text("GO BACK TO HOME PAGE")
          }
        )
        .buttonStyle(WhiteSuperWideButton())
        .frame(height: 48)
      }
    }
    .padding(.top, 32)
    .padding(.horizontal, 16)
    .background(Color.white)
    .cornerRadius(8)
    .shadow(radius: 2)
    .animation(.easeOut, value: true)
  }
}

struct DialogTimeInView_Previews: PreviewProvider {
  static var previews: some View {
    DialogTimeInView()
  }
}

