//
//  TrackingManager.swift
//  FADemo
//
//  Created by John Lima on 11/03/19.
//  Copyright © 2019 limadeveloper. All rights reserved.
//
//  **********************************
//  Example unsing Firebase Analytics
//
//  Warning: Firebase require a .plist file,
//  so don't forget to create one before setup the analytics
//  **********************************

import Foundation
import Firebase
import BaseTracking

final class TrackingManager {
  static let shared = TrackingManager()
}

extension TrackingManager: BaseTrackingProtocol {
  func configure() {
    FirebaseApp.configure()
  }

  func track(event log: BaseTrackingEventLogData) {
    Analytics.logEvent(log.name, parameters: log.parameters)
  }

  func track(view data: BaseTrackingViewData) {
    Analytics.setScreenName(data.name, screenClass: data.className)
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
