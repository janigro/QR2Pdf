//
//  PDFPageSize.swift
//

import Foundation

public enum PDFPageSize {
    
    case inches(width: Float, height: Float)
    case cm(width: Float, height: Float)
    case pt(width: Float, height: Float)
    case QR
    case A4
    case Letter
    
    var width: Float {
        get {
            switch self {
            case let .inches(w, _):
                return w * 72
            case let .cm(w, _):
                return w * 28.3465
            case let .pt(w, _):
                return w
            case .QR:
                return 7 * 28.3465
            case .A4:
                return 21 * 28.3465
            case .Letter:
                return 8.5 * 72
            }
        }
    }
    
    var height: Float {
        get {
            switch self {
            case let .inches(_, h):
                return h * 72
            case let .cm(h, _):
                return h * 28.3465
            case let .pt(h, _):
                return h
            case .QR:
                return 7 * 28.3465
            case .A4:
                return 29.7 * 28.3465
            case .Letter:
                return 11 * 72
            }
        }
    }
}
