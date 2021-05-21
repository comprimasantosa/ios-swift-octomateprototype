//
//  DummyData.swift
//  Octomate Prototype
//
//  Created by Prima Santosa on 21/05/21.
//

import Foundation

final class DummyData {
  static let announcements = [
    Announcement(
      title: "Adecco",
      subtitle: "A warm welcome onboard!",
      body: "Hi all, here is a quick onboarding document to get you started",
      tag: "General",
      date: "07/10/2019"
    ),
    Announcement(
      title: "Adecco",
      subtitle: "A warm welcome onboard!",
      body: "Hi all, here is a quick onboarding document to get you started",
      tag: "General",
      date: "07/10/2019"
    ),
    Announcement(
      title: "Adecco",
      subtitle: "A warm welcome onboard!",
      body: "Hi all, here is a quick onboarding document to get you started",
      tag: "General",
      date: "07/10/2019"
    )
  ]
  
  static let reminders = [
    Reminder(
      title: "Your timesheet has not been submitted!",
      placement: "09321 (IBM Singapore)",
      dateFrom: "12 Jan 2018",
      dateTo: "16 Dec 2018"
    ),
    Reminder(
      title: "Your timesheet has not been submitted!",
      placement: "09321 (IBM Singapore)",
      dateFrom: "12 Jan 2018",
      dateTo: "16 Dec 2018"
    ),
    Reminder(
      title: "Your timesheet has not been submitted!",
      placement: "09321 (IBM Singapore)",
      dateFrom: "12 Jan 2018",
      dateTo: "16 Dec 2018"
    )
  ]
  
  static let events = [
    Event(
      title: "Another Associate",
      tag: "Submitted",
      isEditable: true,
      timeFrom: "05:00 PM",
      timeTo: "07:00 PM",
      totalHours: "02H 00M",
      totalBreak: "00h 00M"
    ),
    Event(
      title: "SIN8 Associate",
      tag: "Approved",
      isEditable: true,
      timeFrom: "05:00 PM",
      timeTo: "07:00 PM",
      totalHours: "02H 00M",
      totalBreak: "00h 00M"
    ),
    Event(
      title: "SIN8 Associate",
      tag: "Rejected",
      isEditable: true,
      timeFrom: "05:00 PM",
      timeTo: "07:00 PM",
      totalHours: "02H 00M",
      totalBreak: "00h 00M"
    )
  ]
}
