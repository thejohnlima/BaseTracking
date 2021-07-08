//
//  TrackingManager.swift
//  GADemo
//
//  Created by John Lima on 13/03/19.
//  Copyright © 2019 thejohnlima. All rights reserved.
//
//  **********************************
//  Example using Google Analytics
//  **********************************

import BaseTracking

final class TrackingManager {
  
  // MARK: - Constants
  private let gaProductionID = "AA-00000000-00"
  private let gaDevelopID = "BB-00000000-00"
  
  // MARK: - Properties
  private var gaID = String()

  static let shared = TrackingManager()
  
  // MARK: - Initializers
  private init() {}
}

// MARK: - BaseTrackingProtocol
extension TrackingManager: BaseTrackingProtocol {
  func configure() {
    gaID = gaProductionID

    let googleAnalytics = GAI.sharedInstance()
    googleAnalytics?.trackUncaughtExceptions = true

    #if DEBUG
    gaID = gaDevelopID
    googleAnalytics?.logger.logLevel = .verbose
    #endif

    let tracker = googleAnalytics?.tracker(withTrackingId: gaID)
    tracker?.allowIDFACollection = true
  }
  
  func track(event data: BaseTrackingEventData) {
    let tracker = GAI.sharedInstance().tracker(withTrackingId: self.gaID)

    let dictionary = GAIDictionaryBuilder.createEvent(
      withCategory: data.category,
      action: data.action,
      label: data.label,
      value: data.value
    )

    if let dictionary = dictionary?.build() as? [AnyHashable: Any] {
      tracker?.send(dictionary)
    }
  }
  
  func track(view data: BaseTrackingViewData) {
    let tracker = GAI.sharedInstance().tracker(withTrackingId: self.gaID)
    tracker?.set(kGAIScreenName, value: data.name)

    let dictionary = GAIDictionaryBuilder.createScreenView().build()

    if let dictionary = dictionary as? [AnyHashable: Any] {
      tracker?.send(dictionary)
    }
  }
}

// MARK: - BaseTrackingEvent
extension BaseTrackingEvent {
  static func trackView(name: ScreenView) {
    let data = BaseTrackingViewData(
      name: name.rawValue as? String ?? "",
      className: nil
    )
    TrackingManager.shared.track(view: data)
  }
  
  static func trackEvent(category: EventCategory, action: EventAction, label: EventLabel? = nil, value: NSNumber? = nil) {
    let data = (
      category: category.rawValue as? String,
      action: action.rawValue as? String,
      label: label?.rawValue as? String,
      value: value ?? nil
    )
    TrackingManager.shared.track(event: data)
  }
}
