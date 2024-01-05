// swift-tools-version: 5.9
import PackageDescription

private extension PackageDescription.Target.Dependency {
     static let nimble: Self = .product(name: "Nimble", package: "Nimble")
}

private extension PackageDescription.Target.PluginUsage {
    // static let swiftGen: Self = .plugin(name: "SwiftGenPlugin", package: "SwiftGenPlugin")
}

let package = Package(
    name: "mockolo-sample",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v17),
    ],
    products: [
        .library(
            name: "App",
            targets: ["App"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Nimble.git", from: "13.1.2"),
    ],
    targets: [
        .target(
            name: "App",
            dependencies: ["CoreRepository"],
            plugins: [
            ]
        ),
        .target(
            name: "CoreRepository",
            dependencies: ["CoreSource"],
            path: "./Sources/Core/Repository"
        ),
        .testTarget(
            name: "CoreRepositoryTest",
            dependencies: [
                "CoreRepository",
                "Mocks",
                .nimble,
            ],
            path: "./Tests/Core/RepositoryTest"
        ),
        .target(
            name: "CoreSource",
            path: "./Sources/Core/Source"
        ),
        .testTarget(
            name: "CoreSourceTest",
            dependencies: [
                "CoreSource",
                .nimble
            ],
            path: "./Tests/Core/SourceTest",
            exclude: [".gitkeep"]
        ),
        .target(
            name: "Mocks",
            dependencies: [
                "CoreRepository",
                "CoreSource",
            ],
            path: "./Tests/Mocks",
            exclude: [".gitkeep"]
        ),
    ]
)
