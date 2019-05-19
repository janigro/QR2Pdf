//
//  QRPdf+Text.swift
//

import Foundation

extension QRPdf {

    internal func objText(obj: Int, text: String, position: PDFPosition, fontSize: Int = 12, color: PDFColor = .blue) -> Data {
        let txtStream = """
                        BT
                        \(color.string)
                        /F1 \(fontSize) Tf
                        \(position.x) \(position.y) Td
                        (\(text))Tj
                        ET
                        """

        return stream(obj: obj, stream: txtStream)
    }
    
    internal func objFont(obj: Int) -> Data {
        
        let t = """
                <<
                  /Type /Font
                  /Subtype /Type1
                  /Name /F1
                  /BaseFont /Helvetica
                >>
                """
        
        return object(obj: obj, content: t)
    }

}
