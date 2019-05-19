//
//  QRPdf+QR.swift
//

import Foundation

extension QRPdf {
    
    internal func objQR(obj: Int) -> Data {
        // Background
        var str = ""
        
        var left = properties.dimension.left
        var bottom = properties.dimension.bottom
        
        for row in matrix.reversed() {
            let size = properties.dimension.size / Float(row.count)
            
            left = properties.dimension.left
            
            for col in row {
                str += getSquareCode(on: col, x: ceil(left), y:ceil(bottom), size: ceil(size))
                left += size
                
            }
            
            bottom += size

        }
        
        return stream(obj: obj, stream: str, comment: "QR code")
    }
    
    internal func getSquareCode(on: Bool, x: Float, y: Float, size: Float) -> String {
        let color = on ? properties.onColor.string : properties.offColor.string

        // The ceil and +1 are added to avoid some weird lines shown otherwise.
        let s = """
        \(color)
        \(ceil(x)) \(ceil(y)) \(ceil(size+1)) \(ceil(size+1)) re
        f
        
        """
        
        return s
    }

}
