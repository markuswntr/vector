// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "Vector",
    products: [
        .library(name: "Vector", targets: ["Vector", "VectorShims"])
    ],
    targets: [
        .target(name: "VectorShims", dependencies: [], path: "Sources/Shims"),
        .target(name: "Vector", dependencies: ["VectorShims"], path: "Sources/Vector"),
        .testTarget(name: "VectorTests", dependencies: ["Vector"])
    ]
)
