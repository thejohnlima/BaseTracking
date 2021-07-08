<h1 align="center">BaseTracking</h1>

<p align="center">
 <a href="https://github.com/thejohnlima/BaseTracking/releases">
  <img src="https://img.shields.io/github/v/release/thejohnlima/BaseTracking?style=for-the-badge">
 </a>
 <a href="https://github.com/thejohnlima/BaseTracking/actions">
  <img src="https://img.shields.io/github/workflow/status/thejohnlima/BaseTracking/CI/master?style=for-the-badge">
 </a>
 <a href="https://cocoapods.org/pods/BaseTracking">
  <img src="https://img.shields.io/badge/Cocoa%20Pods-✓-4BC51D.svg?style=for-the-badge">
 </a><br>
 <a href="https://github.com/thejohnlima/BaseTracking">
  <img src="https://img.shields.io/github/repo-size/thejohnlima/BaseTracking.svg?style=for-the-badge">
 </a>
 <a href="https://raw.githubusercontent.com/thejohnlima/BaseTracking/master/LICENSE">
  <img src="https://img.shields.io/github/license/thejohnlima/BaseTracking.svg?style=for-the-badge">
 </a>
 <a href="https://developer.apple.com/ios/">
  <img src="https://img.shields.io/cocoapods/p/BaseTracking?style=for-the-badge">
 </a>
 <a href="https://developer.apple.com/swift/">
  <img src="https://img.shields.io/badge/Swift-5-blue.svg?style=for-the-badge">
 </a>
 <a href="https://paypal.me/johncls">
  <img src="https://img.shields.io/badge/Donate-PayPal-blue.svg?style=for-the-badge">
 </a>
</p>

**BaseTracking** is the easiest way to setup your analytics in Swift.

## ❗️Requirements

- iOS 9.3+
- Swift 5.0+

## ⚒ Installation

### Swift Package Manager

**BaseTracking** is available through [SPM](https://developer.apple.com/videos/play/wwdc2019/408/). To install
it, follow the steps:

```script
Open Xcode project > File > Swift Packages > Add Package Dependecy
```

After that, put the url in the field: `https://github.com/thejohnlima/BaseTracking.git`

### CocoaPods

**BaseTracking** is available through [CocoaPods](https://cocoapods.org/pods/BaseTracking). To install
it, simply add the following line to your Podfile:

```ruby
pod 'BaseTracking'
```

and run `pod install`

## 🎓 How to use

**Firebase Analytics**

Example using a `HomeViewController`:

```swift
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
```

Example for `HomeTracking` file:

```swift
import BaseTracking

struct HomeTracking: BaseTrackingEventLog {
  enum ScreenName: String {
    case home
  }

  enum EventName: String {
    case openMenu = "home_open_menu"
    case showDetails = "home_open_details"
  }

  typealias ClassName = CustomRawRepresentable
  typealias EventParameters = CustomRawRepresentable
}

extension HomeTracking {

  /// Prepare the parameters using dynamic values
  /// - Parameter value: Dynamic value
  /// - Returns: Event Parameters
  static func getSelectButtonParameter(_ value: Any) -> EventParameters? {
    let item: [String: Any] = ["button_name": value]
    return EventParameters(rawValue: item)
  }
}
```

`TrackingManager` file configuration :

```swift
import Firebase
import BaseTracking

final class TrackingManager: BaseTrackingProtocol {
  static let shared = TrackingManager()

  func configure() {
    FirebaseApp.configure()
    FirebaseConfiguration.shared.setLoggerLevel(.warning)
  }

  func track(event log: BaseTrackingEventLogData) {
    logEvent(log.name, parameters: log.parameters)
    Analytics.logEvent(log.name, parameters: log.parameters)
  }

  func track(view data: BaseTrackingViewData) {
    logEvent(data.name)
    Analytics.setScreenName(data.name, screenClass: data.className)
  }

  private func logEvent(_ name: String, parameters: [String : Any]? = nil) {
    print("📊 Analytics - \(name)\n\(parameters ?? [:])")
  }
}

// MARK: - BaseTrackingEventLog
extension BaseTrackingEventLog {
  static func trackView(name: ScreenName, className: ClassName? = nil) {
    let data = BaseTrackingViewData(
      name: name.rawValue as? String ?? "",
      className: className?.rawValue as? String
    )
    TrackingManager.shared.track(view: data)
  }

  static func trackEvent(name: EventName, parameters: EventParameters? = nil) {
    let data = BaseTrackingEventLogData(
      name: name.rawValue as? String ?? "",
      parameters: parameters?.rawValue as? [String: Any]
    )
    TrackingManager.shared.track(event: data)
  }
}
```

If you need examples unsing [Google Analytics](https://analytics.google.com) or [Segment Analytics](http://segment.com), feel free to take a look at [`demo projects`](https://github.com/thejohnlima/BaseTracking/tree/master/Examples/).

## 🙋🏻‍ Communication

- If you found a bug, open an issue.
- If you have a feature request, open an issue.
- If you want to contribute, submit a pull request. 👨🏻‍💻

Trello [`Board`](https://trello.com/b/IapEnelI)
## 📜 License

**BaseTracking** is under MIT license. See the [LICENSE](https://raw.githubusercontent.com/thejohnlima/BaseTracking/master/LICENSE) file for more info.
