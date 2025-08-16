// swift-tools-version:5.3

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
  platforms: [.iOS(.v12)],
  products: [
    .library(
      name: "IronSourceAdapterTarget",
      targets: ["IronSourceAdapterTarget", "IronSourceSDK"]
    )
  ],
  targets: [
    .target(
      name: "IronSourceAdapterTarget",
      dependencies: [
        .target(name: "IronSourceAdapter")
      ],
      path: "IronSourceAdapterTarget"
    ),
    .binaryTarget(
      name: "IronSourceAdapter",
      url:
        "https://dl.google.com/googleadmobadssdk/mediation/ios/ironsource/IronSourceAdapter-8.10.0.0.0.zip",
      checksum: "6076e68ab3e5851253301f2f4a8ff5c20d71ede2e6cb2f3b9b214eb8053d73fd"
    ),
    .binaryTarget(
      name: "IronSourceSDK",
      url:
        "https://github.com/ironsource-mobile/iOS-sdk/raw/master/8.10.0/IronSource8.10.0.zip",
      checksum: "75f6acb4803e3c4574be3fd5a2fdeff9e0c33526bb37e772153d2c5df5141c49"
    ),
  ]
)
