// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "factory-sample",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v14),
        .macOS(.v12),
    ],    
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Features",
            targets: ["Features"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/SwiftGen/SwiftGenPlugin", exact: "6.6.2"),
        .package(url: "https://github.com/hmlongco/Factory", exact: "2.0.3"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Features",
            dependencies: [
                "CoreRepository",
                .product(name: "Factory", package: "Factory"),
            ],
            plugins: [
                .plugin(name: "SwiftGenPlugin", package: "SwiftGenPlugin"),
            ]
        ),
        .testTarget(
            name: "FeaturesTests",
            dependencies: ["Features"]
        ),
        .target(
            name: "CoreRepository",
            dependencies: [
                "CoreSource",
                .product(name: "Factory", package: "Factory"),
            ],
            path: "./Sources/Core/Repository"
        ),
        .testTarget(
            name: "CoreRepositoryTest",
            dependencies: [
                "CoreRepository",
            ],
            path: "./Tests/Core/RepositoryTest"
        ),
        .target(
            name: "CoreSource",
            dependencies: [
                .product(name: "Factory", package: "Factory"),
            ],
            path: "./Sources/Core/Source"
        ),
        .testTarget(
            name: "CoreSourceTest",
            dependencies: ["CoreSource"],
            path: "./Tests/Core/SourceTest"
        ),
    ]
)
