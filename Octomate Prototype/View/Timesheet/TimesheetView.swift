//
//  TimesheetView.swift
//  Octomate Prototype
//
//  Created by Prima Santosa on 21/05/21.
//

import SwiftUI

struct TimesheetView: View {
  @State var isDrawerOpen: Bool = false
  var dateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "EEE dd"
    return formatter
  }
  var monthFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMMM yyyy"
    return formatter
  }
  
  var body: some View {
    ZStack {
      ScrollView {
        VStack(alignment: .leading) {
          CalendarView(calendar: Calendar(identifier: .gregorian))
          
          HStack {
            Image(systemName: "exclamationmark.circle")
              .foregroundColor(Color(Constants.colorPrimary))
            
            Text("Tip: Tap and hold the date to add multiple\n timesheets")
              .font(Font.custom("NunitoSans-Regular", size: 12))
              .foregroundColor(Color(Constants.colorPrimary))
          }
          .padding(.top, -16)
          .padding(.horizontal, 24)
          
          ZStack {
            Divider()
            HStack {
              Spacer()
              
              Button(
                action: {},
                label: {
                  Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 48, height: 48, alignment: .center)
                    .foregroundColor(Color(Constants.colorPrimaryDark))
                }
              )
              .buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal, 16)
            .padding(.top, -28)
          }
          
          VStack(alignment: .leading) {
            Text("\(dateFormatter.string(from: Date()))")
              .font(Font.custom("NunitoSans-Regular", size: 12))
              .foregroundColor(Color(Constants.colorPrimary))
            
            Text("\(monthFormatter.string(from: Date()))")
              .font(Font.custom("NunitoSans-Bold", size: 14))
              .foregroundColor(.black)
          }
          .padding(.horizontal, 16)
          
          Divider()
          
          ForEach (DummyData.events) { item in
            EventCardView(event: item)
          }
        }
      }
      
      NavDrawerView(isOpen: self.isDrawerOpen)
    }
    .navigationBarTitle("Timesheet")
    .navigationBarBackButtonHidden(true)
    .navigationBarTitleDisplayMode(.inline)
    .navigationBarColor(
      backgroundColor: Constants.colorPrimaryDark,
      tintColor: Constants.navigationTitleColor,
      inlineTitleFont: Constants.inlineTitleFont
    )
    .navigationBarItems(
      leading: Button(
        action: {
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.isDrawerOpen.toggle()
          }
        },
        label: {
          Image(systemName: "line.horizontal.3")
        }
      ),
      trailing: Button(
        action: {},
        label: {
          Image(systemName: "bell.badge.fill")
        }
      )
    )
  }
}

struct TimesheetView_Previews: PreviewProvider {
  static var previews: some View {
    TimesheetView()
  }
}


