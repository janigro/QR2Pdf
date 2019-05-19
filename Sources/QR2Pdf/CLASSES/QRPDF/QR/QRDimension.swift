//
//  QRDimension.swift
//

import Foundation

public enum QRDimension {
    
    case inches(left: Float, bottom: Float, size: Float)
    case cm(left: Float, bottom: Float, size: Float)
    case pt(left: Float, bottom: Float, size: Float)
    case QR
    
    var left: Float {
        get {
            switch self {
            case let .inches(l, _, _):
                return l * 72
            case let .cm(l, _, _):
                return l * 28.3465
            case let .pt(l, _, _):
                return l
            case .QR:
                return 1 * 28.3465
            }
        }
    }

    var bottom: Float {
        get {
            switch self {
            case let .inches(_, t, _):
                return t * 72
            case let .cm(_, t, _):
                return t * 28.3465
            case let .pt(_, t, _):
                return t
            case .QR:
                return 1 * 28.3465
            }
        }
    }
    
    var size: Float {
        get {
            switch self {
            case let .inches(_, _, s):
                return s * 72
            case let .cm(_, _, s):
                return s * 28.3465
            case let .pt(_, _, s):
                return s
            case .QR:
                return 5 * 28.3465
            }
        }
    }
    
}
