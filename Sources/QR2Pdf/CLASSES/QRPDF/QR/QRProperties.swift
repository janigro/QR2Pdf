//
//  QRProperties.swift
//

import Foundation

/// Creates a QRProperties enum
///
/// - Parameters:
///     - onColor: The color of the dots in the QR code.
///     - offColor: The color of the blank area in the QR code.
///     - dimension: How to place the QR code (left, botton and size).
///
public struct QRProperties {
    let onColor: PDFColor
    let offColor: PDFColor
    let dimension: QRDimension
    
    public init(onColor: PDFColor, offColor: PDFColor, dimension: QRDimension) {
        self.onColor = onColor
        self.offColor = offColor
        self.dimension = dimension
    }

}
