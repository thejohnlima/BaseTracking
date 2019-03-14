//
//  TrackingManager.swift
//  GADemo
//
//  Created by John Lima on 13/03/19.
//  Copyright © 2019 limadeveloper. All rights reserved.
//
//  **********************************
//  Example unsing Google Analytics
//  **********************************

import Foundation
import BaseTracking

final class TrackingManager {
  
  // MARK: - Constants
  private let gaProductionID = "AA-00000000-00"
  private let gaDevelopID = "BB-00000000-00"
  
  // MARK: - Properties
  private var gaID = String()
  
  // MARK: - Singleton
  static let shared = TrackingManager()
  
  // MARK: - Initializers
  private init() {}
  
  // MARK: - Private Methods
  private func configureAnalytics() {
    gaID = gaProductionID
    
    let googleAnalytics = GAI.sharedInstance()
    googleAnalytics?.trackUncaughtExceptions = true
    
    #if DEVELOPMENT
    gaID = gaDevelopID
    googleAnalytics?.logger.logLevel = .verbose
    #endif
    
    let tracker = googleAnalytics?.tracker(withTrackingId: gaID)
    tracker?.allowIDFACollection = true
  }
  
  private func tracking(view name: BaseTrackingViewData) {
    
    let tracker = GAI.sharedInstance().tracker(withTrackingId: self.gaID)
    tracker?.set(kGAIScreenName, value: name.name)
    
    let gaiMutableDictionary = GAIDictionaryBuilder.createScreenView().build()
    
    if let gaiDictionary = gaiMutableDictionary as? [AnyHashable: Any] {
      tracker?.send(gaiDictionary)
    }
  }
  
  private func tracking(event: BaseTrackingEventData) {
    
    let tracker = GAI.sharedInstance().tracker(withTrackingId: self.gaID)
    
    let gaiMutableDictionary = GAIDictionaryBuilder.createEvent(
      withCategory: event.category,
      action: event.action,
      label: event.label,
      value: event.value
    )
    
    if let gaiDictionary = gaiMutableDictionary?.build() as? [AnyHashable: Any] {
      tracker?.send(gaiDictionary)
    }
  }
}

extension TrackingManager: BaseTrackingProtocol {
  func configure() {
    configureAnalytics()
  }
  
  func track(event data: BaseTrackingEventData) {
    tracking(event: data)
  }
  
  func track(view data: BaseTrackingViewData) {
    tracking(view: data)
  }
}

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
