//
//  ProfileController.swift
//  SEDemo
//
//  Created by John Lima on 6/2/21.
//

import UIKit

class ProfileController: UIViewController {

  @IBOutlet private weak var updateButton: UIButton!
  @IBOutlet private weak var resetButton: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()
    setNeedsFocusUpdate()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    ProfileTracking.trackView(name: .profile)
  }

  override var preferredFocusedView: UIView? {
    if updateButton.isFocused {
      return resetButton
    }
    return updateButton
  }

  @IBAction private func updateProfile() {
    let parameters = ProfileTracking.getParameters(Profile.updated)
    ProfileTracking.trackEvent(name: .update, parameters: parameters)
  }

  @IBAction private func resetProfile() {
    ProfileTracking.resetProfile()
  }
}
