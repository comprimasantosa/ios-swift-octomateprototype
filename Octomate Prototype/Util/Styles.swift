//
//  Styles.swift
//  Octomate Prototype
//
//  Created by Prima Santosa on 21/05/21.
//

import SwiftUI

struct SectionTitleLabel: ViewModifier {
  func body(content: Content) -> some View {
    content
      .padding(.horizontal, 2)
      .foregroundColor(Color.black)
      .font(Font.custom("NunitoSans-Bold", size: 18))
  }
}

struct BodyLabel: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(Font.custom("NunitoSans-Bold", size: 14))
      .foregroundColor(
        Color(UIColor(red: 0.31, green: 0.31, blue: 0.31, alpha: 1.00))
      )
  }
}

struct BodyBlackLabel: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(Font.custom("NunitoSans-Bold", size: 14))
      .foregroundColor(.black)
  }
}

struct PlainGreenButton: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .padding(.all, 4)
      .foregroundColor(Color(Constants.colorPrimary))
      .font(Font.custom("NunitoSans-Bold", size: 14))
  }
}

struct GreenButton: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .padding(.vertical, 6)
      .padding(.horizontal, 20)
      .background(Color(UIColor(red: 0.36, green: 0.73, blue: 0.70, alpha: 1.00)))
      .foregroundColor(.white)
      .font(Font.custom("NunitoSans-Bold", size: 14))
      .cornerRadius(8.0)
  }
}

struct GreenWideButton: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .padding(.vertical, 10)
      .padding(.horizontal, 90)
      .background(Color(UIColor(red: 0.36, green: 0.73, blue: 0.70, alpha: 1.00)))
      .foregroundColor(.white)
      .font(Font.custom("NunitoSans-Bold", size: 14))
      .cornerRadius(8.0)
  }
}

struct WhiteButton: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .padding(.vertical, 8)
      .padding(.horizontal, 20)
      .background(Color.white)
      .foregroundColor(Color(UIColor(red: 0.51, green: 0.79, blue: 0.77, alpha: 1.00)))
      .font(Font.custom("NunitoSans-Bold", size: 14))
      .cornerRadius(8.0)
  }
}

struct WhiteWideButton: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .padding(.vertical, 13)
      .padding(.horizontal, 140)
      .background(Color.white)
      .foregroundColor(Color(UIColor(red: 0.51, green: 0.79, blue: 0.77, alpha: 1.00)))
      .font(Font.custom("NunitoSans-Bold", size: 16))
      .cornerRadius(8.0)
  }
}

struct WhiteSuperWideButton: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .background(Color.white)
      .foregroundColor(Color(UIColor(red: 0.51, green: 0.79, blue: 0.77, alpha: 1.00)))
      .font(Font.custom("NunitoSans-Bold", size: 16))
      .cornerRadius(8.0)
  }
}
