//
//  QRCode+PDF.swift
//

import Foundation
import swift_qrcodejs

public extension QRCode {
    static var defaultProperties = QRProperties(onColor: .black, offColor: .white, dimension: .QR)
    
    /// Creates a QRPdf object with all the information required to generate a PDF. The object can later
    /// be used to create a pdf file (as Data or saved directly to a file)
    ///
    /// - Parameters:
    ///     - matrix: A [[Bool]] matrix that contains the QR data. It can be obtained from
    ///               QRCode.imageCodes
    ///     - pageSize: A PDFPageSize object that determines the PDF page size
    ///     - bgColor: Background color for the PDF.
    ///     - behindText: Array of PDFText for labels to place in the PDF, behind the QR code.
    ///     - frontText: Array of PDFText for labels to place in the PDF, in front of the QR code.
    ///
    func pdf(pageSize: PDFPageSize = .QR, properties: QRProperties = defaultProperties, bgColor: PDFColor = .rgb(0.5, 0.6, 0.5), behindText: [PDFText] = [], frontText: [PDFText] = []) -> QRPdf {
        
        let qr2pdf = QRPdf(matrix: self.imageCodes,
                           pageSize: pageSize,
                           properties: properties,
                           bgColor: bgColor,
                           behindText: behindText,
                           frontText: frontText)
        
        return qr2pdf
    }
    
}
