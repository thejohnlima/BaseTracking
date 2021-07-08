//
//  ProfileController.swift
//  SEDemo
//
//  Created by John Lima on 6/2/21.
//

import UIKit

class ProfileController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    ProfileTracking.trackView(name: .profile)
  }

  @IBAction private func updateProfile() {
    let parameters = ProfileTracking.getParameters(Profile.updated)
    ProfileTracking.trackEvent(name: .update, parameters: parameters)
  }

  @IBAction private func resetProfile() {
    ProfileTracking.resetProfile()
  }
}
