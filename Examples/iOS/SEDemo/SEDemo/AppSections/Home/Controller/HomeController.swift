//
//  HomeController.swift
//  SEDemo
//
//  Created by John Lima on 6/2/21.
//  Copyright © 2021 thejohnlima. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    ProfileTracking.trackIdentity(Profile.current)
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    HomeTracking.trackView(name: .home)
  }

  @IBAction private func openCamera() {
    let params = HomeTracking.getOpenCameraParameters("home")
    HomeTracking.trackEvent(name: .openCamera, parameters: params)
  }
}
