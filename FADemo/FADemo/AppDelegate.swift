//
//  AppDelegate.swift
//  FADemo
//
//  Created by John Lima on 11/03/19.
//  Copyright © 2019 limadeveloper. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    TrackingManager.shared.configure()
    return true
  }
}
