// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "PackageSwiftEnumation",
    products: [
        .executable(
            name: "pse",
            targets: [Modules.packageSwiftEnumation.rawValue]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0")
    ],
    targets: [
        .executableTarget(
            name: Modules.packageSwiftEnumation.rawValue,
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]
        ),
    ]
)
// sourcery:inline:Modules.TemplateName
enum Modules: String {
    case packageSwiftEnumation = "PackageSwiftEnumation"
}
// sourcery:end
