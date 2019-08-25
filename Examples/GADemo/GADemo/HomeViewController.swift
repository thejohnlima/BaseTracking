//
//  HomeViewController.swift
//  GADemo
//
//  Created by John Lima on 13/03/19.
//  Copyright © 2019 limadeveloper. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    HomeTracking.trackView(name: .home)
  }
  
  @IBAction private func showDetails(sender: Any?) {
    let buttonName = (sender as? UIBarButtonItem)?.title ?? ""
    let label = HomeTracking.getSelectButtonParameter(buttonName)
    HomeTracking.trackEvent(category: .home, action: .showDetails, label: label)
  }
}
