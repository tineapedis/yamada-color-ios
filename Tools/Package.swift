// swift-tools-version:5.4
import PackageDescription

let package = Package(
    name: "Tools",
    platforms: [.macOS(.v11)],
    dependencies: [
        .package(url: "https://github.com/realm/SwiftLint", from: "0.43.1"),
    ],
    targets: [.target(name: "Tools", path: "")]
)
