//
//  HomeTracking.swift
//  SEDemo
//
//  Created by John Lima on 6/2/21.
//

import BaseTracking

struct HomeTracking: BaseTrackingEventLog {
  typealias ClassName = CustomRawRepresentable
  typealias EventParameters = CustomRawRepresentable

  enum ScreenName: String {
    case home
  }

  enum EventName: String {
    case openCamera = "home_open_camera"
  }
}

extension HomeTracking {

  /// Prepare the parameters using dynamic values
  /// - Parameter value: Dynamic value
  /// - Returns: Event Parameters
  static func getOpenCameraParameters(_ value: Any) -> EventParameters? {
    let item: [String: Any] = ["category": value]
    return EventParameters(rawValue: item)
  }
}
