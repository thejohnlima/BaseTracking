//
//  TrackingManager.swift
//  FADemo
//
//  Created by John Lima on 11/03/19.
//  Copyright © 2019 limadeveloper. All rights reserved.
//
//  **********************************
//  Example unsing Firebase Analytics
//  **********************************

import Foundation
import Firebase
import BaseTracking

final class TrackingManager {

  static let shared = TrackingManager()

  private init() {}

  private func configureAnalytics() {
    FirebaseApp.configure()
  }

  private func tracking(view data: BaseTrackingViewData) {
    Analytics.setScreenName(data.name, screenClass: data.className)
  }

  private func tracking(event: BaseTrackingEventLogData) {
    Analytics.logEvent(event.name, parameters: event.parameters)
  }
}

extension TrackingManager: BaseTrackingProtocol {
  func configure() {
    configureAnalytics()
  }

  func track(event log: BaseTrackingEventLogData) {
    tracking(event: log)
  }

  func track(view data: BaseTrackingViewData) {
    tracking(view: data)
  }
}

extension BaseTrackingEventLog {
  static func trackView(name: ScreenName, className: ClassName? = nil) {
    let data = BaseTrackingViewData(
      name: name.rawValue as? String ?? "",
      className: className?.rawValue as? String
    )
    TrackingManager.shared.track(view: data)
  }

  static func trackEvent(name: EventName, parameters: EventParameters? = nil) {
    let data = BaseTrackingEventLogData(
      name: name.rawValue as? String ?? "",
      parameters: parameters?.rawValue as? [String: Any]
    )
    TrackingManager.shared.track(event: data)
  }
}
