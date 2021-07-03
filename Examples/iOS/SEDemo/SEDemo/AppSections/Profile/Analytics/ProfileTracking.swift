//
//  ProfileTracking.swift
//  SEDemo
//
//  Created by John Lima on 6/2/21.
//

import BaseTracking

struct ProfileTracking: BaseTrackingEventLog {
  typealias ClassName = CustomRawRepresentable
  typealias EventParameters = CustomRawRepresentable

  enum ScreenName: String {
    case profile
  }

  enum EventName: String {
    case update = "profile_update"
    case reset = "profile_reset"
  }
}

extension ProfileTracking {

  /// Prepare the parameters using dynamic values
  /// - Parameter value: Dynamic value
  /// - Returns: Event Parameters
  static func getParameters(_ profile: Profile?) -> EventParameters? {
    guard let parameters = profile?.dictionary() else { return nil }
    return EventParameters(rawValue: parameters)
  }

  /// Request and track user info
  /// - Parameter profile: User Profile
  static func trackIdentity(_ profile: Profile?) {
    guard let profile = profile else { return }
    TrackingManager.shared.requestTrackingAuthorization(profile.id, info: profile.dictionary())
  }

  /// Tracking reset profile
  static func resetProfile() {
    TrackingManager.shared.reset(EventName.reset.rawValue)
  }
}
