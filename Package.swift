// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "Monthage",
    platforms: [.macOS(.v13)],
    products: [
        .executable(name: "Monthage", targets: ["Monthage"])
    ],
    dependencies: [],
    targets: [
        .executableTarget(
            name: "Monthage",
            dependencies: [],
            linkerSettings: [
                .linkedFramework("AppKit"),
                .linkedFramework("Foundation")
            ]
        ),
        .testTarget(
            name: "MonthageTests",
            dependencies: ["Monthage"]
        )
    ]
)
