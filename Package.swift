// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "Vector",
    platforms: [
        .iOS(.v12),
        .tvOS(.v12),
        .watchOS(.v5),
        .macOS(.v10_14),
        // .ubuntu(.v14.04)
    ],
    products: [
        .library(name: "Vector", targets: ["Vector"])
    ],
    dependencies: [
        .package(url: "https://github.com/markuswntr/simdx.git", .branch("master"))
    ],
    targets: [
        .target(name: "Vector", dependencies: ["SIMDX"]),
        .testTarget(name: "VectorTests", dependencies: ["Vector"])
    ]
)
