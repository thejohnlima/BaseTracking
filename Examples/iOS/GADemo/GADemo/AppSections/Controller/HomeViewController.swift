//
//  HomeViewController.swift
//  GADemo
//
//  Created by John Lima on 13/03/19.
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
    HomeTracking.trackEvent(category: .home, action: .openMenu)
  }

  @IBAction private func showDetails(_ sender: Any?) {
    // Example using dynamic values
    let buttonName = (sender as? UIBarButtonItem)?.title ?? ""
    let label = HomeTracking.getSelectButtonParameter(buttonName.lowercased())
    HomeTracking.trackEvent(category: .home, action: .showDetails, label: label)
  }
}
