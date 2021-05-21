//
//  CalendarView.swift
//  Octomate Prototype
//
//  Created by Prima Santosa on 21/05/21.
//
//  Code from https://gist.github.com/alahdal/deb37df908be07d2a64456229276665e
//  with some adjustment

import SwiftUI

struct CalendarView: View {
  private let calendar: Calendar
  private let monthFormatter: DateFormatter
  private let dayFormatter: DateFormatter
  private let weekDayFormatter: DateFormatter
  private let fullFormatter: DateFormatter
  
  @State private var selectedDate = Self.now
  private static var now = Date() // Cache now
  
  init(calendar: Calendar) {
    self.calendar = calendar
    self.monthFormatter = DateFormatter(dateFormat: "MMMM yyyy", calendar: calendar)
    self.dayFormatter = DateFormatter(dateFormat: "d", calendar: calendar)
    self.weekDayFormatter = DateFormatter(dateFormat: "EEE", calendar: calendar)
    self.fullFormatter = DateFormatter(dateFormat: "MMMM dd, yyyy", calendar: calendar)
  }
  
  var body: some View {
    VStack {
      CalendarComponentView(
        calendar: calendar,
        date: $selectedDate,
        content: { date in
          Button(action: { selectedDate = date }) {
            Text("00")
              .padding(8)
              .foregroundColor(.clear)
              .background(
                calendar.isDate(date, inSameDayAs: selectedDate) ? Color(Constants.colorPrimary)
                  : .white
              )
              .clipShape(Circle())
              .accessibilityHidden(true)
              .overlay(
                Text(dayFormatter.string(from: date))
                  .font(Font.custom("NunitoSans-Regular", size: 14))
                  .foregroundColor(
                    Color(UIColor(red: 0.36, green: 0.36, blue: 0.36, alpha: 1.00))
                  )
              )
          }
        },
        trailing: { date in
//          Text(dayFormatter.string(from: date))
//            .font(Font.custom("NunitoSans-Regular", size: 14))
//            .foregroundColor(.secondary)
        },
        header: { date in
          Text(weekDayFormatter.string(from: date))
            .font(Font.custom("NunitoSans-Regular", size: 16))
            .foregroundColor(Color(Constants.colorPrimary))
        },
        title: { date in
          HStack {
            Button {
              withAnimation {
                guard let newDate = calendar.date(
                  byAdding: .month,
                  value: -1,
                  to: selectedDate
                ) else {
                  return
                }
                
                selectedDate = newDate
              }
            } label: {
              Label(
                title: { Text("Previous") },
                icon: {
                  Image(systemName: "chevron.left")
                    .foregroundColor(Color(Constants.colorPrimary))
                }
              )
              .labelStyle(IconOnlyLabelStyle())
              .padding(.horizontal)
              .frame(maxHeight: .infinity)
            }
            
            Image(systemName: "calendar")
              .foregroundColor(Color(Constants.colorPrimary))
            
            Text(monthFormatter.string(from: date))
              .font(Font.custom("NunitoSans-Bold", size: 16))
              .foregroundColor(Color(Constants.colorPrimary))
              .padding()
            
            Button {
              withAnimation {
                guard let newDate = calendar.date(
                  byAdding: .month,
                  value: 1,
                  to: selectedDate
                ) else {
                  return
                }
                
                selectedDate = newDate
              }
            } label: {
              Label(
                title: { Text("Next") },
                icon: {
                  Image(systemName: "chevron.right")
                    .foregroundColor(Color(Constants.colorPrimary))
                }
              )
              .labelStyle(IconOnlyLabelStyle())
              .padding(.horizontal)
              .frame(maxHeight: .infinity)
            }
          }
          .padding(.bottom, 6)
        }
      )
      .equatable()
    }
    .padding()
  }
  
  func getSelectedDate() -> Date {
    return self.selectedDate
  }
}


public struct CalendarComponentView<Day: View, Header: View, Title: View, Trailing: View>: View {
  // Injected dependencies
  private var calendar: Calendar
  @Binding private var date: Date
  private let content: (Date) -> Day
  private let trailing: (Date) -> Trailing
  private let header: (Date) -> Header
  private let title: (Date) -> Title
  
  // Constants
  private let daysInWeek = 7
  
  public init(
    calendar: Calendar,
    date: Binding<Date>,
    @ViewBuilder content: @escaping (Date) -> Day,
    @ViewBuilder trailing: @escaping (Date) -> Trailing,
    @ViewBuilder header: @escaping (Date) -> Header,
    @ViewBuilder title: @escaping (Date) -> Title
  ) {
    self.calendar = calendar
    self._date = date
    self.content = content
    self.trailing = trailing
    self.header = header
    self.title = title
  }
  
  public var body: some View {
    let month = date.startOfMonth(using: calendar)
    let days = makeDays()
    
    return LazyVGrid(columns: Array(repeating: GridItem(), count: daysInWeek)) {
      Section(header: title(month)) {
        ForEach(days.prefix(daysInWeek), id: \.self, content: header)
        ForEach(days, id: \.self) { date in
          if calendar.isDate(date, equalTo: month, toGranularity: .month) {
            content(date)
          } else {
            trailing(date)
          }
        }
      }
    }
  }
}

// MARK: - Conformances

extension CalendarComponentView: Equatable {
  public static func == (lhs: CalendarComponentView<Day, Header, Title, Trailing>, rhs: CalendarComponentView<Day, Header, Title, Trailing>) -> Bool {
    lhs.calendar == rhs.calendar && lhs.date == rhs.date
  }
}

// MARK: - Helpers

private extension CalendarComponentView {
  func makeDays() -> [Date] {
    guard let monthInterval = calendar.dateInterval(of: .month, for: date),
          let monthFirstWeek = calendar.dateInterval(of: .weekOfMonth, for: monthInterval.start),
          let monthLastWeek = calendar.dateInterval(of: .weekOfMonth, for: monthInterval.end - 1)
    else {
      return []
    }
    
    let dateInterval = DateInterval(start: monthFirstWeek.start, end: monthLastWeek.end)
    return calendar.generateDays(for: dateInterval)
  }
}

private extension Calendar {
  func generateDates(
    for dateInterval: DateInterval,
    matching components: DateComponents
  ) -> [Date] {
    var dates = [dateInterval.start]
    
    enumerateDates(
      startingAfter: dateInterval.start,
      matching: components,
      matchingPolicy: .nextTime
    ) { date, _, stop in
      guard let date = date else { return }
      
      guard date < dateInterval.end else {
        stop = true
        return
      }
      
      dates.append(date)
    }
    
    return dates
  }
  
  func generateDays(for dateInterval: DateInterval) -> [Date] {
    generateDates(
      for: dateInterval,
      matching: dateComponents([.hour, .minute, .second], from: dateInterval.start)
    )
  }
}

private extension Date {
  func startOfMonth(using calendar: Calendar) -> Date {
    calendar.date(
      from: calendar.dateComponents([.year, .month], from: self)
    ) ?? self
  }
}

private extension DateFormatter {
  convenience init(dateFormat: String, calendar: Calendar) {
    self.init()
    self.dateFormat = dateFormat
    self.calendar = calendar
  }
}
