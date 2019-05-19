//
//  PDFPosition.swift
//

import Foundation

public enum PDFPosition {
    case inches(x: Float, y: Float)
    case cm(x: Float, y: Float)
    case pt(x: Float, y: Float)
    
    var x: Float {
        get {
            switch self {
            case let .inches (x, _):
                return x * 72
            case let .cm (x, _):
                return x * 28.3465
            case let .pt (x, _):
                return x
            }
        }
    }
    
    var y: Float {
        get {
            switch self {
            case let .inches (_, y):
                return y * 72
            case let .cm (_, y):
                return y * 28.3465
            case let .pt (_, y):
                return y
            }
        }
    }
}
