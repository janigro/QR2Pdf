//
//  QRPdf+Background.swift
//

import Foundation

extension QRPdf {
    
    internal func objBackground(obj: Int) -> Data {

        let str = """
        \(bgColor.string)
        0 0 m
        \(pageSize.width) 0 l
        \(pageSize.width) \(pageSize.height) l
        0 \(pageSize.height) l
        f
        
        """
        
        return stream(obj: obj, stream: str, comment: "Background")
        
    }

}
