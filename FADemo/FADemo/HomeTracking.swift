//
//  HomeTracking.swift
//  FADemo
//
//  Created by John Lima on 12/03/19.
//  Copyright © 2019 limadeveloper. All rights reserved.
//

import Foundation

struct HomeTracking: BaseTrackingEventLog {
  enum ScreenName: String {
    case home
  }

  enum EventName: String {
    case showDetails = "show_home_details"
  }

  typealias ClassName = CustomRawRepresentable
  typealias EventParameters = CustomRawRepresentable
}

extension HomeTracking {
  static func getSelectButtonParameter(_ value: Any) -> EventParameters? {
    let item: [String: Any] = ["button_name": value]
    return EventParameters(rawValue: item)
  }
}
