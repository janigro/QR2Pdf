//
//  Int.swift
//

import Foundation

extension Int {
    mutating func inc(_ val: Int = 1) -> Int {
        self = self + val
        return self
    }
}
