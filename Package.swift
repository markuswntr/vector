// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "Vector",
    products: [
        .library(name: "Vector", targets: ["Vector"])
    ],
    targets: [
        .target(name: "Vector"),
        .testTarget(name: "VectorTests", dependencies: ["Vector"])
    ]
)
