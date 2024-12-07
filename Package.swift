// swift-tools-version: 5.5

import PackageDescription

let package = Package(
    name: "opentrivia",
    platforms: [
        .macOS(.v10_15) // Specify macOS 10.15 or newer
    ],
    targets: [
        .executableTarget(
            name: "opentrivia",
            path: "Sources/opentrivia"
        )
    ]
)