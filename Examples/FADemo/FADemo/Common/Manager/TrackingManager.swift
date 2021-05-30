//
//  TrackingManager.swift
//  FADemo
//
//  Created by John Lima on 11/03/19.
//  Copyright © 2019 thejohnlima. All rights reserved.
//
//  **********************************
//  Example using Firebase Analytics
//
//  Warning: Firebase require a .plist file,
//  so don't forget to create one before setup the analytics
//  **********************************

import Firebase
import BaseTracking

final class TrackingManager: BaseTrackingProtocol {
  static let shared = TrackingManager()

  func configure() {
    FirebaseApp.configure()
    FirebaseConfiguration.shared.setLoggerLevel(.warning)
  }

  func track(event log: BaseTrackingEventLogData) {
    logEvent(log.name, parameters: log.parameters)
    Analytics.logEvent(log.name, parameters: log.parameters)
  }

  func track(view data: BaseTrackingViewData) {
    logEvent(data.name)
    Analytics.setScreenName(data.name, screenClass: data.className)
  }

  private func logEvent(_ name: String, parameters: [String : Any]? = nil) {
    print("📊 Analytics - \(name)\n\(parameters ?? [:])")
  }
}

// MARK: - BaseTrackingEventLog
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
