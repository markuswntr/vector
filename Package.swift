// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "Vector",
    products: [
        .library(name: "Vector", targets: ["Vector"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-numerics/", from: "0.0.4")
    ],
    targets: [
        .target(name: "Vector"),
        .testTarget(name: "VectorTests", dependencies: ["Vector"])
    ]
)
