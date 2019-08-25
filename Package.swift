// swift-tools-version:5.1

import PackageDescription

let package = Package(
  name: "BaseTracking",
  products: [
    .library(
      name: "BaseTracking",
      targets: ["BaseTracking"]
    ),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "BaseTracking",
      dependencies: []
    ),
    .testTarget(
      name: "BaseTrackingTests",
      dependencies: ["BaseTracking"]
    ),
  ]
)
