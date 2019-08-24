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

@testable
import BaseTracking

struct HomeTrack {}

extension HomeTrack: BaseTrackingEvent {
  enum ScreenView: String {
    case home = "screen name to send"
  }

  enum EventCategory: String {
    case category = "category name to send"
  }

  enum EventAction: String {
    case tapButton = "action name to send"
  }

  enum EventLabel: String {
    case label = "label description to send"
  }
}

extension HomeTrack: BaseTrackingEventLog {
  enum ScreenName: String {
    case home = "screen name to send"
  }

  enum ClassName: String {
    case home = "class name to send"
  }

  enum EventName: String {
    case home = "event name to send"
  }

  enum EventParameters: String {
    case home = "event parameters to send"
  }
}
