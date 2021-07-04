//
//  TrackingManager.swift
//  SEDemo
//
//  Created by John Lima on 6/2/21.
//  Copyright © 2021 thejohnlima. All rights reserved.
//

import AppTrackingTransparency
import BaseTracking
import Segment

final class TrackingManager: BaseTrackingProtocol {
  // MARK: - Constants
  private let segmentKey = "SEGMENT_KEY"

  // MARK: - Properties
  static let shared = TrackingManager()

  var trackingAuthorized: Bool {
    if #available(iOS 14, *) {
      return ATTrackingManager.trackingAuthorizationStatus == .authorized
    } else {
      return true
    }
  }

  var trackingDenied: Bool {
    if #available(iOS 14, *) {
      return ATTrackingManager.trackingAuthorizationStatus == .denied
    } else {
      return false
    }
  }

  // MARK: - Public Methods
  func requestTrackingAuthorization(_ id: String, info: [String: Any]?) {
    if trackingAuthorized {
      return identity(id, info: info)
    }

    if #available(iOS 14, *) {
      ATTrackingManager.requestTrackingAuthorization { status in
        if case .authorized = status {
          self.identity(id, info: info)
        }
      }
    }
  }

  func configure() {
    let configuration = AnalyticsConfiguration(writeKey: segmentKey)
    configuration.trackApplicationLifecycleEvents = true
    configuration.recordScreenViews = false

    Analytics.setup(with: configuration)
  }

  func track(view data: BaseTrackingViewData) {
    print("📊 Analytics Screen - \(data.name)")
    Analytics.shared().screen(data.name)
  }

  func track(event log: BaseTrackingEventLogData) {
    print("📊 Analytics Event - \(log.name)\n\(log.parameters ?? [:])")
    Analytics.shared().track(log.name, properties: log.parameters)
  }

  func identity(_ id: String, info: [String: Any]?) {
    print("📊 Analytics Identify - \(id)\nInfo: \(info ?? [:])")
    Analytics.shared().identify(id, traits: info)
  }

  func reset(_ name: String) {
    print("📊 Analytics Reset: \(name)")
    Analytics.shared().track(name)
    Analytics.shared().flush()
    Analytics.shared().reset()
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
