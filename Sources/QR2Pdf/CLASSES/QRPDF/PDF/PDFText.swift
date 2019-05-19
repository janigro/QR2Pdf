//
//  PDFText.swift
//

import Foundation

public struct PDFText {
    let text: String
    let color: PDFColor
    let position: PDFPosition
    let size: Int
    
    public init(text: String, color: PDFColor, position: PDFPosition, size: Int) {
        self.text = text
        self.color = color
        self.position = position
        self.size = size        
    }
}
