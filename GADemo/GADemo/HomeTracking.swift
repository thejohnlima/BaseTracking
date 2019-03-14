//
//  HomeTracking.swift
//  GADemo
//
//  Created by John on 13/03/19.
//  Copyright © 2019 John Lima. All rights reserved.
//

import Foundation

struct HomeTracking: BaseTrackingEvent {
  enum ScreenView: String {
    case home
  }
  
  enum EventCategory: String {
    case home = "home_category"
  }
  
  enum EventAction: String {
    case showDetails = "show_home_details"
  }
  
  typealias EventLabel = CustomRawRepresentable
}

extension HomeTracking {
  static func getSelectButtonParameter(_ value: Any) -> EventLabel? {
    let item = "button name - \(value)"
    return EventLabel(rawValue: item)
  }
}
