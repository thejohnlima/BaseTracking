//
//  Profile.swift
//  SEDemo
//
//  Created by John Lima on 6/2/21.
//

import LMStorage

struct Profile: LMCodable {
  let id: String
  let name: String

  static var current: Profile? {
    let profile = Profile(id: "123", name: "John")
    return profile
  }

  static var updated: Profile? {
    let profile = Profile(id: "12345", name: "John Lima")
    return profile
  }
}
