// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "miniapp-appkit-sdk",
    platforms: [
        .macOS(.v11)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "miniapp-appkit-sdk",
            targets: ["miniapp-appkit-sdk", "miniapp_appkit"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/stanydsouza/miniapp-core-sdk.git", .upToNextMajor(from: "0.0.1"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "miniapp-appkit-sdk",
            dependencies: [
                .product(name: "miniapp-core-sdk", package: "miniapp-core-sdk")
            ]
        ),
        .binaryTarget(
            name: "miniapp_appkit",
            path: "./Sources/miniapp_appkit.xcframework"
        )
    ]
)
