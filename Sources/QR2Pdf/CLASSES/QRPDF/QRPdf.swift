//
//  QRPdf.swift
//

import Foundation

public class QRPdf {
    let matrix: [[Bool]]
    var properties: QRProperties
    var bgColor: PDFColor
    var pageSize: PDFPageSize
    var behindText: [PDFText]
    var frontText: [PDFText]
    
    internal let encoding: String.Encoding = .nonLossyASCII
    
    internal var buffer: Data! = nil
    internal var xrf: [Int]! = nil
    internal var headerSize: Int = 0
    internal var xrf_offset: Int = 0
    
    /// Creates a QRPdf object with all the information required to generate a PDF
    ///
    /// - Parameters:
    ///     - matrix: A [[Bool]] matrix that contains the QR data. It can be obtained from
    ///               QRCode.imageCodes
    ///     - pageSize: A PDFPageSize object that determines the PDF page size
    ///     - bgColor: Background color for the PDF.
    ///     - behindText: Array of PDFText for labels to place in the PDF, behind the QR code.
    ///     - frontText: Array of PDFText for labels to place in the PDF, in front of the QR code.
    ///
    public init(matrix: [[Bool]],
         pageSize: PDFPageSize = .QR,
         properties: QRProperties,
         bgColor: PDFColor = .white,
         behindText: [PDFText] = [],
         frontText: [PDFText] = []) {
        
        self.matrix = matrix
        self.properties = properties
        self.bgColor = bgColor
        self.pageSize = pageSize
        self.behindText = behindText
        self.frontText = frontText
    }
    
    /// Creates a pdf file with the QR code
    ///
    /// - Parameters:
    ///     - url: URL of the file were the pdf is saved
    ///
    /// - Throws:
    ///     - Writing error
    public func save(url: URL) throws {
        let data = self.data()
        
        try data.write(to: url)
    }

    /// Creates a pdf file with the QR code
    ///
    /// - Parameters:
    ///     - url: URL of the file were the pdf is saved
    ///
    /// - Returns: A pdf as a Data object
    public func data() -> Data {
        self.buffer = Data()
        self.xrf = [Int]()
        
        let header = self.header()
        buffer.append(header)
        
        headerSize = header.count
        
        let objs = objArray(start: 5, count: 1 + behindText.count + 1 + frontText.count )
        
        addObject(object: self.objCatalog(obj: 1, pagesObj: 2))
        addObject(object: self.objPages(obj: 2, kids: [3]))
        addObject(object: self.objPage(obj: 3, parent: 2, fontObj: 4, objs: objs))
        addObject(object: self.objFont(obj: 4))

        var idx = 4

        addObject(object: self.objBackground(obj: idx.inc()))

        behindText.forEach { pText in
            addObject(object: self.objText(obj: idx.inc(), text: pText.text, position: pText.position, fontSize: pText.size, color: pText.color))
        }
        
        addObject(object: self.objQR(obj: idx.inc()))
        
        frontText.forEach { pText in
            addObject(object: self.objText(obj: idx.inc(), text: pText.text, position: pText.position, fontSize: pText.size, color: pText.color))
        }
        
        addXrf()
        addTrailer()
        
        return buffer
    }
    
}
