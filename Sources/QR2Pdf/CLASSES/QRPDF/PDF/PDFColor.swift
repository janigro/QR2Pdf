//
//  PDFColor.swift
//

import Foundation

public enum PDFColor {
    case rgb(_ red: Float, _ green: Float, _ blue: Float)
    case gray(_ pct: Float)
    case red
    case blue
    case green
    case yellow
    case orange
    case white
    case black
    
    var string: String {
        get {
            switch self {
            case let .rgb(r, g, b):
                return "\(r) \(g) \(b) rg"
            case let .gray(pct):
                return "\(pct) g"
            case .red:
                return "1 0.231 0.188 rg"
            case .green:
                return "0.298 0.85 0.392 rg"
            case .blue:
                return "0 0.478 1 rg"
            case .yellow:
                return "1 0.8 0 rg"
            case .orange:
                return "1 0.584 0 rg"
            case .black:
                return "0 0 0 rg"
            case .white:
                return "1 1 1 rg"
            }
        }
    }
}
