// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "DevPanel",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "DevPanel",
            targets: ["DevPanel"]
        ),
    ],
    targets: [
        .target(
            name: "DevPanel",
            dependencies: [],
            path: "Sources/DevPanel"
        )
    ]
)
