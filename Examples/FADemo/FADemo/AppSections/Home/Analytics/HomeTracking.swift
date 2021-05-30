//
//  HomeTracking.swift
//  FADemo
//
//  Created by John Lima on 12/03/19.
//  Copyright © 2019 thejohnlima. All rights reserved.
//

import BaseTracking

struct HomeTracking: BaseTrackingEventLog {
  enum ScreenName: String {
    case home
  }

  enum EventName: String {
    case openMenu = "home_open_menu"
    case showDetails = "home_open_details"
  }

  typealias ClassName = CustomRawRepresentable
  typealias EventParameters = CustomRawRepresentable
}

extension HomeTracking {

  /// Prepare the parameters using dynamic values
  /// - Parameter value: Dynamic value
  /// - Returns: Event Parameters
  static func getSelectButtonParameter(_ value: Any) -> EventParameters? {
    let item: [String: Any] = ["button_name": value]
    return EventParameters(rawValue: item)
  }
}
