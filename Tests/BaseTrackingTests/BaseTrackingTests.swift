//  MIT License
//
//  Copyright (c) 2019 John Lima
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import XCTest
@testable import BaseTracking

final class BaseTrackingTests: XCTestCase {

  // MARK: - Properties
  private var manager: TrackManager?
  private var controller: HomeController?

  static var allTests = [
    ("testSetupSuccess", testSetupSuccess),
  ]

  // MARK: - Overrides
  override func setUp() {
    super.setUp()
    manager = TrackManager.shared
    manager?.configure()

    controller = HomeController()
  }

  override func tearDown() {
    manager = nil
    controller = nil
    super.tearDown()
  }

  // MARK: - Test Methods
  func testSetupSuccess() {
    XCTAssertEqual(manager?.mock.gaSetup, true)
    XCTAssertEqual(manager?.mock.firebaseSetup, true)
  }

  func testTrackView() {
    controller?.viewDidLoad()
    XCTAssertEqual(manager?.mock.trackViewData?.name, "screen name to send")
  }

  func testTrackEventData() {
    controller?.primaryButtonTapped()
    XCTAssertEqual(manager?.mock.trackEventData?.category, "category name to send")
    XCTAssertEqual(manager?.mock.trackEventData?.action, "action name to send")
    XCTAssertEqual(manager?.mock.trackEventData?.label, "label description to send")
  }

  func testTrackEventLog() {
    controller?.secondaryButtonTapped()
    XCTAssertEqual(manager?.mock.trackEventLog?.name, "event name to send")
  }
}
