//
//  TimerView.swift
//  Octomate Prototype
//
//  Created by Prima Santosa on 21/05/21.
//

import SwiftUI

struct TimerView: View {
  @State var now = ""
  let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  var dateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "hh:mm:ss a"
    return formatter
  }
  
  var body: some View {
    Text("\(now)")
      .onReceive(timer) { _ in
        self.now = dateFormatter.string(from: Date())
      }
      .font(Font.custom("NunitoSans-Bold", size: 14))
      .foregroundColor(Color(Constants.colorPrimaryDark))
      .padding(.bottom, 14)
  }
}

struct TimerView_Previews: PreviewProvider {
  static var previews: some View {
    TimerView()
  }
}



