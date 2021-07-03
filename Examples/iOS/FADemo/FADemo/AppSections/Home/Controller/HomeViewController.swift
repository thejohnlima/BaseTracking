//
//  HomeViewController.swift
//  FADemo
//
//  Created by John Lima on 11/03/19.
//  Copyright © 2019 thejohnlima. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

  // MARK: - View LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    HomeTracking.trackView(name: .home)
  }

  // MARK: - Actions
  @IBAction private func openMenu(_ sender: Any?) {
    // Example using static values
    HomeTracking.trackEvent(name: .openMenu)
  }

  @IBAction private func showDetails(_ sender: Any?) {
    // Example using dynamic values
    let buttonName = (sender as? UIBarButtonItem)?.title ?? ""
    let parameters = HomeTracking.getSelectButtonParameter(buttonName)
    HomeTracking.trackEvent(name: .showDetails, parameters: parameters)
  }
}
