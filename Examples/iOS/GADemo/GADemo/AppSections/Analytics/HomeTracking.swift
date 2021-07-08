//
//  HomeTracking.swift
//  GADemo
//
//  Created by John on 13/03/19.
//  Copyright © 2019 John Lima. All rights reserved.
//

import BaseTracking

struct HomeTracking: BaseTrackingEvent {
  enum ScreenView: String {
    case home
  }
  
  enum EventCategory: String {
    case home = "home_category"
  }
  
  enum EventAction: String {
    case openMenu = "home_open_menu"
    case showDetails = "home_open_details"
  }
  
  typealias EventLabel = CustomRawRepresentable
}

extension HomeTracking {

  /// Prepare the parameters using dynamic values
  /// - Parameter value: Dynamic value
  /// - Returns: Event Parameters
  static func getSelectButtonParameter(_ value: Any) -> EventLabel? {
    let item = "button name - \(value)"
    return EventLabel(rawValue: item)
  }
}
