// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "CxxLibrary",
    platforms: [.macOS(.v13), .iOS(.v16)],
    products: [
        .library(
            name: "CxxLibrary",
            targets: ["SwiftModule"]
        ),
        .executable(
            name: "test-cli",
            targets: ["TestCli"]
        )
    ],
    targets: [
        .target(
            name: "CxxModule"
        ),
        .target(
            name: "SwiftModule",
            dependencies: ["CxxModule"],
            swiftSettings: [.interoperabilityMode(.Cxx)]
        ),
        .executableTarget(
            name: "TestCli",
            dependencies: ["CxxModule", "SwiftModule"],
            swiftSettings: [.interoperabilityMode(.Cxx)]
        )
    ]
)
