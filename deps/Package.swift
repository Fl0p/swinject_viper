// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "deps",
    products: [
        .library(
            name: "deps",
            targets: ["deps"]),
    ],
    dependencies: [
        .package(
            url:  "https://github.com/freshOS/Stevia",
            .upToNextMinor(from: "5.1.4")
        ),
        .package(
            url: "https://github.com/sunshinejr/SwiftyUserDefaults",
            .upToNextMinor(from: "5.3.0")
        ),
        .package(
            url: "https://github.com/Swinject/Swinject",
            .upToNextMinor(from: "2.8.5")
        ),
        .package(
            url: "https://github.com/ReactiveX/RxSwift",
            .upToNextMinor(from: "6.6.0")
        ),
    ],
    targets: [
        .target(
            name: "deps",
            dependencies: [
                "Stevia",
                "SwiftyUserDefaults",
                "Swinject",
                .product(name: "RxSwift", package: "RxSwift"),
                .product(name: "RxCocoa", package: "RxSwift"),
                .product(name: "RxRelay", package: "RxSwift")
            ]
        ),
        .testTarget(
            name: "depsTests",
            dependencies: ["deps"]),
    ],
    swiftLanguageVersions: [.v5]
)
