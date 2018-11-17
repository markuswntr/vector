// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "Vector",
    products: [
        .library(name: "Vector", targets: ["Vector"])
    ],
    targets: [
        .target(name: "Vector", dependencies: []),
        .testTarget(name: "VectorTests", dependencies: ["Vector"])
    ]
)
