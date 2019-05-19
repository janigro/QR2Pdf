// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "QR2Pdf",
    platforms: [
       .macOS(.v10_12), .iOS(.v8), .watchOS(.v2), .tvOS(.v9),
    ],
    products: [
       .library(name: "QR2Pdf", targets: ["QR2Pdf"]),
    ],
    dependencies: [
      .package(url: "https://github.com/ApolloZhu/swift_qrcodejs.git", from: "1.1.1"),
    ],
    targets: [
      .target(name: "QR2Pdf", dependencies: [ "swift_qrcodejs"]),
      .testTarget(name: "QR2PdfTests", dependencies: ["QR2Pdf"]),
    ]
)
