//
//  CharacterSet+Hexadecimal.swift
//  SwiftUIExtensions
//
//  Created by Ben Shutt on 17/01/2022.
//

import Foundation

public extension CharacterSet {

    /// Hexadecimal characters (uppercase and lowercase)
    static var hexadecimal: CharacterSet {
        return CharacterSet(charactersIn: "0123456789abcdefABCDEF")
    }
}
