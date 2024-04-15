// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Shared",
    platforms: [.iOS(.v15), .macOS(.v12)],
    products: [
        .executable(name: "Benchmarks", targets: ["Benchmarks"])
    ],
    dependencies: [
        .package(url: "https://github.com/google/swift-benchmark", from: "0.1.0")
    ],
    targets: [
        .target(
            name: "Shapes",
            dependencies: [],
            swiftSettings: [.unsafeFlags(["-Xfrontend", "-strict-concurrency=complete"])]
        ),
        .testTarget(
            name: "ShapesTests",
            dependencies: ["Shapes"]
        ),
        .executableTarget(
            name: "Benchmarks",
            dependencies: [
                .product(name: "Benchmark", package: "swift-benchmark"),
                "Shapes"
            ]
        )
    ]
)
