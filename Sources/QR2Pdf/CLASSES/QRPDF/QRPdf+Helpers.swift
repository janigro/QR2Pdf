//
//  QRPdf+Helpers.swift
//

import Foundation

extension QRPdf {
    
    internal func padded(_ v: Int) -> String {
        return String(format: "%010d", v)
    }
    
    internal func pdfArray(objs: [Int]) -> String {
        var oarr = "["
        
        objs.forEach { oarr += " \($0) 0 R "}
        
        oarr += "]"
        
        return oarr
    }
    
    internal func objArray(start: Int, count: Int) -> [Int] {
        var objs = [Int]()
        
        for idx in start..<(start+count) {
            objs.append(idx)
        }
        
        return objs
    }
    
    internal func stream(obj: Int, stream: String, comment: String? = nil) -> Data {
        
        let x = """
        <<
        /Length \(stream.count)
        >>
        stream
        \(stream)
        endstream
        """
        
        return object(obj: obj, content: x, comment: comment)
        
    }
    
    internal func object(obj: Int, content: String, comment: String? = nil) -> Data {
        let c: String
        
        if let comment = comment {
            c = "  % \(comment)"
        } else {
            c = ""
        }
        
        let p = """
        \(obj) 0 obj\(c)
        \(content)
        endobj
        
        
        """
        
        return p.data(using: encoding) ?? Data()
    }
    
}
