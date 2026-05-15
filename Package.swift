// swift-tools-version:5.6

// Copyright 2025 Google LLC.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import PackageDescription

let package = Package(
  name: "IronSourceAdapter",
  platforms: [.iOS(.v13)],
  products: [
    .library(
      name: "IronSourceAdapterTarget",
      targets: ["IronSourceAdapterTarget"]
    )
  ],
  dependencies: [
    .package(
      url: "https://github.com/ironsource-mobile/Unity-Mediation-iAds-Swift-Package.git",
      exact: "9.4.1"
    ),
    .package(
      url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
      from: "13.3.0"
    ),
  ],
  targets: [
    .target(
      name: "IronSourceAdapterTarget",
      dependencies: [
        .target(name: "IronSourceAdapter"),
        .product(name: "UnityMediationSDK", package: "Unity-Mediation-iAds-Swift-Package"),
        .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
      ],
      path: "IronSourceAdapterTarget"
    ),
    .binaryTarget(
      name: "IronSourceAdapter",
      url:
        "https://dl.google.com/googleadmobadssdk/mediation/ios/ironsource/IronSourceAdapter-9.4.1.0.1.zip",
      checksum: "8b41d93c58ea015fc9e5dba89f9053e3f97d21345d3e820e6927fd85772dcc60"
    ),
  ]
)
