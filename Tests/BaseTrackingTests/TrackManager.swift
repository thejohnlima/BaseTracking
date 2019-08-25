//  MIT License
//
//  Copyright (c) 2019 John Lima
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

@testable
import BaseTracking
import Foundation

final class TrackManager {

  // MARK: - Constants
  private let gaProductionID = "AA-00000000-00"
  private let gaDevelopID = "BB-00000000-00"

  // MARK: - Properties
  static let shared = TrackManager()

  var gaID = String()
  var mock = Mock()

  // MARK: - Structs
  struct Mock {
    var gaSetup = false
    var firebaseSetup = false
    var trackEventData: BaseTrackingEventData?
    var trackEventLog: BaseTrackingEventLogData?
    var trackViewData: BaseTrackingViewData?
  }

  // MARK: - Initializers
  private init() {}

  // MARK: - Private Methods
  private func setupGoogleAnalytics() {
    gaID = gaProductionID

    // let googleAnalytics = GAI.sharedInstance()
    // googleAnalytics?.trackUncaughtExceptions = true

    #if DEVELOPMENT
    gaID = gaDevelopID
    // googleAnalytics?.logger.logLevel = .verbose
    #endif

    // let tracker = googleAnalytics?.tracker(withTrackingId: gaID)
    // tracker?.allowIDFACollection = true

    mock.gaSetup = true
  }

  private func setupFirebase() {
    // FirebaseApp.configure()
    mock.firebaseSetup = true
  }
}

// MARK: - BaseTrackingProtocol
extension TrackManager: BaseTrackingProtocol {
  func configure() {
    setupGoogleAnalytics()
    setupFirebase()
  }

  func track(event data: BaseTrackingEventData) {
    /*
    let tracker = GAI.sharedInstance().tracker(withTrackingId: self.gaID)

    let gaiMutableDictionary = GAIDictionaryBuilder.createEvent(
      withCategory: data.category,
      action: data.action,
      label: data.label,
      value: data.value
    )

    if let gaiDictionary = gaiMutableDictionary?.build() as? [AnyHashable: Any] {
      tracker?.send(gaiDictionary)
    }
    */

    mock.trackEventData = data
  }

  func track(view data: BaseTrackingViewData) {
    /*
    let tracker = GAI.sharedInstance().tracker(withTrackingId: self.gaID)
    tracker?.set(kGAIScreenName, value: name.name)

    let gaiMutableDictionary = GAIDictionaryBuilder.createScreenView().build()

    if let gaiDictionary = gaiMutableDictionary as? [AnyHashable: Any] {
      tracker?.send(gaiDictionary)
    }
    */

    // Analytics.setScreenName(data.name, screenClass: data.className)

    mock.trackViewData = data
  }

  func track(event log: BaseTrackingEventLogData) {
    // Analytics.logEvent(log.name, parameters: log.parameters)
    mock.trackEventLog = log
  }
}

// MARK: - BaseTrackingEvent
extension BaseTrackingEvent {
  static func trackView(name: ScreenView) {
    let data = BaseTrackingViewData(
      name: name.rawValue as? String ?? "",
      className: nil
    )
    TrackManager.shared.track(view: data)
  }

  static func trackEvent(category: EventCategory, action: EventAction, label: EventLabel? = nil, value: NSNumber? = nil) {
    let data: BaseTrackingEventData = (
      category: category.rawValue as? String,
      action: action.rawValue as? String,
      label: label?.rawValue as? String,
      value: value ?? nil
    )
    TrackManager.shared.track(event: data)
  }
}

// MARK: - BaseTrackingEventLog
extension BaseTrackingEventLog {
  static func trackView(name: ScreenName, className: ClassName? = nil) {
    let data = BaseTrackingViewData(
      name: name.rawValue as? String ?? "",
      className: className?.rawValue as? String
    )
    TrackManager.shared.track(view: data)
  }

  static func trackEvent(name: EventName, parameters: EventParameters? = nil) {
    let data = BaseTrackingEventLogData(
      name: name.rawValue as? String ?? "",
      parameters: parameters?.rawValue as? [String: Any]
    )
    TrackManager.shared.track(event: data)
  }
}
