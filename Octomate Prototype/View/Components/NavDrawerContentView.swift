//
//  NavDrawerContentView.swift
//  Octomate Prototype
//
//  Created by Prima Santosa on 20/05/21.
//

import SwiftUI

struct NavDrawerContentView: View {
  @AppStorage("isLogin") var isLogin = false
  @AppStorage("name") var name = ""
  
  var body: some View {
    ZStack {
      Color.white
      VStack(alignment: .leading) {
        ForEach(Constants.drawerTopMenuItems.indices, id: \.self) { item in
          NavDrawerMenuItemView(item: item)
        }
        Spacer()
        VStack(alignment: .leading) {
          HStack {
            NavigationLink(
              destination: Text("Not Implemented"),
              label: {
                Image(systemName: "bag")
                  .frame(width: 23, height: 27, alignment: .center)
                  .aspectRatio(contentMode: .fit)
                  .foregroundColor(Color(Constants.colorPrimaryDark))
                  .padding(.trailing, 8)
                Text("My Claims")
                Spacer()
              }
            )
            .buttonStyle(PlainButtonStyle())
            .padding(.horizontal, 32)
            .padding(.vertical, 16)
          }
          HStack {
            Button(
              action: {
                isLogin = false
                name = ""
              },
              label: {
                Text("LOGOUT")
                  .padding(.horizontal, 36)
                  .font(Font.custom("NunitoSans-Bold", size: 16))
                  .foregroundColor(
                    Color(UIColor(red: 0.86, green: 0.56, blue: 0.59, alpha: 1.00))
                  )
              }
            )
            
            Spacer()
          }
        }
      }
      
      NavigationLink(
        destination: LoginView(viewModel: LoginViewModel(repository: OctoRepository.shared)),
        isActive: Binding<Bool>(get: {return !self.isLogin},
                                set: { value in self.isLogin = value}),
        label: {}
      )
      .buttonStyle(PlainButtonStyle())
      .padding(.horizontal, 32)
    }
  }
}

struct DrawerView_Previews: PreviewProvider {
  static var previews: some View {
    NavDrawerContentView()
  }
}

