//
//  AnnouncementCardView.swift
//  Octomate Prototype
//
//  Created by Prima Santosa on 19/05/21.
//

import SwiftUI

struct AnnouncementCardView: View {
  let announcement: Announcement
  
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Circle()
          .frame(width: 12, height: 12, alignment: .center)
          .foregroundColor(
            Color(UIColor(red: 0.84, green: 0.51, blue: 0.54, alpha: 1.00))
          )
        
        Text("\(announcement.title)")
          .font(Font.custom("NunitoSans-Bold", size: 16))
          .foregroundColor(
            Color(UIColor(red: 0.23, green: 0.23, blue: 0.23, alpha: 1.00))
          )
        
        Spacer()
        
        Text("\(announcement.date)")
          .font(Font.custom("NunitoSans-Bold", size: 14))
          .foregroundColor(
            Color(UIColor(red: 0.71, green: 0.71, blue: 0.71, alpha: 1.00))
          )
      }
      Text("\(announcement.subtitle)")
        .font(Font.custom("NunitoSans-Bold", size: 16))
        .foregroundColor(Color(Constants.colorPrimary))
      
      Text("\(announcement.body)")
        .modifier(BodyLabel())
      
      HStack {
        ZStack {
          Text("\(announcement.tag)")
            .font(Font.custom("NunitoSans-Bold", size: 14))
            .foregroundColor(.black)
        }
        .frame(width: 100, height: 28, alignment: .center)
        .background(
          Color(UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.00))
        )
        .cornerRadius(8.0)
        
        Spacer()
        
        Button(
          action: {},
          label: {
            Text("Read More")
          }
        )
        .buttonStyle(PlainGreenButton())
      }
      .padding(.top, 8)
    }
    .padding()
    .frame(width: 340)
    .background(Color.white)
    .cornerRadius(8.0)
  }
}

struct AnnouncementCardView_Previews: PreviewProvider {
  static var previews: some View {
    AnnouncementCardView(
      announcement:
        Announcement(
          title: "Adecco",
          subtitle: "A warm welcome onboard!",
          body: "Hi all, here is a quick onboarding document to get you started",
          tag: "General",
          date: "07/10/2019"
        )
    )
  }
}


