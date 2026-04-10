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
      exact: "9.4.0"
    ),
    .package(
      url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
      from: "13.0.0"
    )
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
        "https://dl.google.com/googleadmobadssdk/mediation/ios/ironsource/IronSourceAdapter-9.4.0.0.0.zip",
      checksum: "c315aade4f84b5c4360335b85a3f963009b443c539114e8ca3f5425d2dfa7cc3"
    )
  ]
)
