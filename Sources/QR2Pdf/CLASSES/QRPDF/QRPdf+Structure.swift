//
//  QRPdf+Structure
//

import Foundation

extension QRPdf {

    internal func header() -> Data {
        
        let t = """
                %PDF-1.7


                """
        
        return t.data(using: encoding) ?? Data()
    }
    
    internal func addXrf() {
        var xrf_text = """
        xref
        0 \(xrf.count + 1)
        0000000000 65535 f
        
        """
        
        xrf.forEach {
            xrf_text += "\(padded($0)) 00000 n\n"
        }
        
        xrf_offset = buffer.count
        buffer.append(xrf_text.data(using: encoding) ?? Data())
    }
    
    internal func addTrailer() {
        let trailer = """
        trailer
        <<
        /Root 1 0 R
        /Size \(xrf.count)
        >>
        startxref
        \(xrf_offset)
        %%EOF
        
        """
        
        buffer.append(trailer.data(using: encoding) ?? Data())
        
    }
    
    internal func objCatalog(obj: Int, pagesObj: Int) -> Data {
        let t = """
                <<
                  /Type /Catalog
                  /Pages \(pagesObj) 0 R
                >>
                """
        
        return object(obj: obj, content: t, comment: "entry point")

    }
    
    internal func objPages(obj: Int, kids: [Int]) -> Data {
        
        let t = """
                <<
                  /Type /Pages
                  /Kids \(pdfArray(objs: kids))
                  /Count 1
                  /MediaBox [ 0 0 \(pageSize.width) \(pageSize.height) ]
                >>
                """
        
        return object(obj: obj, content: t)
    }
    
    internal func objPage(obj: Int, parent: Int, fontObj: Int, objs: [Int]) -> Data {
        
        let t = """
                <<
                  /Type /Page
                  /Parent \(parent) 0 R
                  /Resources <<
                    /Font <<
                      /F1 \(fontObj) 0 R
                    >>
                  >>
                  /Contents \(pdfArray(objs: objs))
                >>
                """
        
        return object(obj: obj, content: t)

    }

    internal func addObject(object: Data) {
        xrf.append(buffer.count)
        buffer.append(object)
    }
    
}
