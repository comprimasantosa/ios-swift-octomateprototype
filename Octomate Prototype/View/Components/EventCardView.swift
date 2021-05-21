//
//  EventCardView.swift
//  Octomate Prototype
//
//  Created by Prima Santosa on 21/05/21.
//

import SwiftUI

struct EventCardView: View {
  let event: Event
  
  var body: some View {
    VStack {
      HStack {
        Text(event.title)
          .font(Font.custom("NunitoSans-Bold", size: 16))
          .foregroundColor(Color(Constants.colorPrimary))
        
        Spacer()
        
        ZStack {
          Text(event.tag)
            .font(Font.custom("NunitoSans-Bold", size: 14))
            .foregroundColor(.black)
        }
        .frame(width: 100, height: 28, alignment: .center)
        .background(
          event.tag == "Submitted" ? Color(UIColor(red: 0.96, green: 0.88, blue: 0.64, alpha: 1.00)) :
          event.tag == "Approved" ? Color(UIColor(red: 0.86, green: 0.89, blue: 0.65, alpha: 1.00)) :
            Color(UIColor(red: 0.88, green: 0.63, blue: 0.65, alpha: 1.00))
        )
        .cornerRadius(8.0)
      }
      .padding(.horizontal, 16)
      
      HStack {
        Text("Time:")
          .font(Font.custom("NunitoSans-Bold", size: 14))
          .foregroundColor(.black)
        
        Text(event.timeFrom)
          .font(Font.custom("NunitoSans-Regular", size: 14))
        
        Text("TO")
          .font(Font.custom("NunitoSans-Bold", size: 14))
          .foregroundColor(.black)
        
        Text(event.timeTo)
          .font(Font.custom("NunitoSans-Regular", size: 14))
        
        Spacer()
      }
      .padding(.horizontal, 16)
      
      HStack {
        Text("Total Hours:")
          .font(Font.custom("NunitoSans-Bold", size: 14))
          .foregroundColor(.black)
        
        Text(event.totalHours)
          .font(Font.custom("NunitoSans-Regular", size: 14))
        
        Spacer()
      }
      .padding(.horizontal, 16)
      
      HStack {
        Text("Break:")
          .font(Font.custom("NunitoSans-Bold", size: 14))
          .foregroundColor(.black)
        
        Text(event.totalBreak)
          .font(Font.custom("NunitoSans-Regular", size: 14))
        
        Spacer()
        
        if event.isEditable {
          Button(
            action: {},
            label: {
              Text("Edit")
                .font(Font.custom("NunitoSans-Bold", size: 14))
                .foregroundColor(Color(Constants.colorPrimary))
                .underline()
            }
          )
          .buttonStyle(PlainButtonStyle())
        }
      }
      .padding(.horizontal, 16)
      
      Divider()
    }
    .padding(.bottom, 8)
    .padding(.top, 4)
  }
}

struct EventCardView_Previews: PreviewProvider {
  static var previews: some View {
    EventCardView(
      event: Event(
        title: "Another Associate",
        tag: "Submitted",
        isEditable: true,
        timeFrom: "05:00 PM",
        timeTo: "07:00 PM",
        totalHours: "02H 00M",
        totalBreak: "00h 00M"
      )
    )
  }
}


