//
//  LoginView.swift
//  Octomate Prototype
//
//  Created by Prima Santosa on 21/05/21.
//

import SwiftUI

struct LoginView: View {
  @StateObject var viewModel: LoginViewModel
  @AppStorage("isLogin") var isLogin = false
  @AppStorage("name") var name = ""
  @State private var username = "mary5@test.com"
  @State private var password = "12345678"
  
  var body: some View {
    NavigationView {
      VStack {
        Text("octomate")
          .padding(.vertical, 128)
          .font(Font.custom("NunitoSans-Bold", size: 42))
          .foregroundColor(.white)
        
        Spacer()
        
        VStack(alignment: .leading) {
          Text("Username")
            .font(Font.custom("NunitoSans-Bold", size: 12))
            .foregroundColor(.white)
          
          TextField("E-mail", text: $username)
            .underlineTextField()
          
          Text("Password")
            .font(Font.custom("NunitoSans-Bold", size: 12))
            .foregroundColor(.white)
            .padding(.top, 12)
          
          SecureField("Password", text: $password)
            .underlineTextField()
        }
        .padding()
        
        NavigationLink(
          destination: ProfileView(),
          isActive: $isLogin,
          label: {
            Button(
              action: {
                viewModel.login(
                  body: [
                    "email" : self.username,
                    "password": self.password
                  ]
                )
              },
              label: {
                Text("Login")
              }
            )
            .buttonStyle(WhiteWideButton())
            .padding(.top, 24)
          }
        )
        .buttonStyle(PlainButtonStyle())
        
        if viewModel.isLoading {
          ProgressView()
            .foregroundColor(.white)
            .padding()
        }
        
        Spacer()
        
        Button(
          action: {},
          label: {
            Text("Forgot Password?")
              .font(Font.custom("NunitoSans-Bold", size: 14))
              .foregroundColor(.white)
              .underline()
              .padding(.top, 12)
          }
        )
        .buttonStyle(PlainButtonStyle())
        
        Spacer()
      }
      .padding()
      .background(
        Color(UIColor(red: 0.34, green: 0.65, blue: 0.63, alpha: 1.00))
      )
      .navigationTitle("")
      .navigationBarHidden(true)
      .edgesIgnoringSafeArea(.all)
      .onReceive(self.viewModel.$name, perform: { result in
        if !result.isEmpty {
          isLogin = true
          name = result
        }
      })
    }
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView(viewModel: LoginViewModel(repository: OctoRepository.shared))
  }
}





