//
//  QR2PdfTests.swift
//  QR2PdfTests
//

import XCTest
import swift_qrcodejs
@testable import QR2Pdf

class QR2PdfTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func test_buildPDF_default() {
        guard let qr = QRCode("Hello World! (default)") else { return XCTFail("Unable to create QR code") }

        let pdf = qr.pdf()
        
        let tmpUrl = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("QR2Pdf_Test.pdf")
        
        do {
            try pdf.save(url: tmpUrl)
            
            print("File saved to: \(tmpUrl)")
            
            NSWorkspace.shared.open(tmpUrl)
        } catch let err {
            return XCTFail("Failed to save file! Error = \(err.localizedDescription)")
        }
        
    }
    
    func test_buildPDF_wText() {
        guard let qr = QRCode("Hello World! (with text)") else { return XCTFail("Unable to create QR code") }
        
        let psize = PDFPageSize.cm(width: 10, height: 10)
        let props = QRProperties(onColor: .black, offColor: .yellow, dimension: .cm(left: 1, bottom: 1, size: 8))
        
        let bTexts:[PDFText] = [
            PDFText(text: "BEHIND111111", color: .black, position: .cm(x: 0, y: 2), size: 12),
            PDFText(text: "BEHIND222222", color: .gray(0.3), position: .cm(x: 0, y: 3), size: 14)
        ]
        
        let fTexts:[PDFText] = [
            PDFText(text: "FRONT33333333", color: .green, position: .cm(x: 0, y: 4), size: 16),
            PDFText(text: "FRONT44444444", color: .orange, position: .cm(x: 0, y: 5), size: 18)
        ]
        
        let pdf = qr.pdf(pageSize: psize,
                         properties: props,
                         bgColor: .red,
                         behindText: bTexts,
                         frontText: fTexts)
        
        let tmpUrl = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("QR2Pdf_Test.pdf")

        do {
            try pdf.save(url: tmpUrl)
            
            print("File saved to: \(tmpUrl)")
            
            NSWorkspace.shared.open(tmpUrl)
        } catch let err {
            return XCTFail("Failed to save file! Error = \(err.localizedDescription)")
        }
        
    }

    func test_buildPDF_woText() {
        guard let qr = QRCode("Hello World! (without text)") else { return XCTFail("Unable to create QR code") }
        
        let psize = PDFPageSize.cm(width: 10, height: 10)
        let props = QRProperties(onColor: .black, offColor: .yellow, dimension: .cm(left: 1, bottom: 1, size: 8))
        
        let pdf = qr.pdf(pageSize: psize,
                         properties: props,
                         bgColor: .red)
        
        let tmpUrl = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("QR2Pdf_Test.pdf")
        
        do {
            try pdf.save(url: tmpUrl)
            
            print("File saved to: \(tmpUrl)")
            
            NSWorkspace.shared.open(tmpUrl)
        } catch let err {
            return XCTFail("Failed to save file! Error = \(err.localizedDescription)")
        }
        
    }
    

}
