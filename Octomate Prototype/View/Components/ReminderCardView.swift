//
//  ReminderCardView.swift
//  Octomate Prototype
//
//  Created by Prima Santosa on 19/05/21.
//

import SwiftUI

struct ReminderCardView: View {
  let reminder: Reminder
  
  var body: some View {
    VStack(alignment: .leading) {
      Text("\(reminder.title)")
        .font(Font.custom("NunitoSans-Bold", size: 16))
        .foregroundColor(.black)
        .padding(.bottom, 2)
      
      Text("Placement: \(reminder.placement)")
        .modifier(BodyLabel())
      
      HStack {
        Text("From")
          .modifier(BodyLabel())
        
        Text("\(reminder.dateFrom)")
          .modifier(BodyBlackLabel())
        
        Text("To")
          .modifier(BodyLabel())
        
        Text("\(reminder.dateTo)")
          .modifier(BodyBlackLabel())
        
        Spacer()
        
        Button(
          action: {},
          label: {
            Text("Submit")
          }
        )
        .buttonStyle(GreenButton())
        .padding(.bottom, 8)
      }
    }
    .padding(.all, 16)
    .background(Color.white)
    .cornerRadius(8.0)
  }
}

struct ReminderCardView_Previews: PreviewProvider {
  static var previews: some View {
    ReminderCardView(
      reminder: Reminder(
        title: "Your timesheet has not been submitted!",
        placement: "09321 (IBM Singapore)",
        dateFrom: "12 Jan 2018",
        dateTo: "16 Dec 2018"
      )
    )
  }
}

