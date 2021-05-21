//
//  ProfileView.swift
//  Octomate Prototype
//
//  Created by Prima Santosa on 19/05/21.
//

import SwiftUI

struct ProfileView: View {
  @AppStorage("name") var name = ""
  @State var isDrawerOpen: Bool = false
  
  var body: some View {
    ZStack {
      ScrollView {
        VStack {
          ProfileHeaderView(name: name)
          
          SectionHeaderView(image: "megaphone", title: "Announcements", showTrailingButton: true)
          
          ScrollView(.horizontal, showsIndicators: false) {
            HStack {
              ForEach (DummyData.announcements) { item in
                AnnouncementCardView(announcement: item)
              }
            }
            .padding(.horizontal, 16)
          }
          
          SectionHeaderView(image: "newspaper", title: "Reminders", showTrailingButton: false)
          
          VStack {
            ForEach (DummyData.reminders) { item in
              ReminderCardView(reminder: item)
            }
          }
          .padding(.horizontal, 16)
        }
      }
      .background(
        Color(UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.00))
      )
      
      NavDrawerView(isOpen: self.isDrawerOpen)
    }
    .navigationBarTitle("Profile")
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

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileView()
  }
}


