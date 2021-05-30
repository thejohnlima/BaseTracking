//
//  AppDelegate.swift
//  GADemo
//
//  Created by John Lima on 13/03/19.
//  Copyright © 2019 thejohnlima. All rights reserved.
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
