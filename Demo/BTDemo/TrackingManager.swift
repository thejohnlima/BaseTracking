//
//  TrackingManager.swift
//  BTDemo
//
//  Created by John Lima on 11/03/19.
//  Copyright © 2019 limadeveloper. All rights reserved.
//
//  **********************************
//  Example unsing Firebase Analytics
//  **********************************

import Foundation
import Firebase

final class TrackingManager {

  static let shared = TrackingManager()

  private init() {}

  private func configureCrashlytics() {
    // Do something here
  }

  private func configureAnalytics() {
    FirebaseApp.configure()
  }

  private func tracking(view name: String) {
    // Do something here
  }

  private func tracking(event: BaseTrackingEventAction) {
    // Do something here
  }
}

extension TrackingManager: BaseTrackingProtocol {
  func configure() {
    configureAnalytics()
    configureCrashlytics()
  }

  func track(event action: BaseTrackingEventAction) {
    tracking(event: action)
  }

  func track(view name: String) {
    tracking(view: name)
  }
}

extension BaseTrackingArea {
  static func trackView(name: ScreenView) {
    TrackingManager.shared.track(view: name.rawValue as? String ?? "")
  }

  static func trackEvent(category: EventCategory, action: EventAction, label: EventLabel? = nil, value: NSNumber? = nil) {
    let event = BaseTrackingEventAction(
      category: category.rawValue as? String,
      action: action.rawValue as? String,
      label: label?.rawValue as? String,
      value: value
    )
    TrackingManager.shared.track(event: event)
  }
}
