//
//  Color+Hex.swift
//  SwiftUIExtensions
//
//  Created by Ben Shutt on 17/01/2022.
//

import SwiftUI

public extension Color {

    /// Initialize `UIColor` with the given HEX `string`.
    ///
    /// The `string` can be of the form:
    /// - RGB (12-bit)
    /// - RGB (24-bit)
    /// - RGBA (32-bit)
    ///
    /// - Parameter string: `RGBAHex` hex formatted color
    init?(hexString string: RGBAHex) {
        // Trim non-alphanumerics (which includes the # character)
        let hex = string.trimmingCharacters(in: .hexadecimal.inverted)

        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (r, g, b, a) = (
                (int >> 8) * 17, // r
                (int >> 4 & 0xF) * 17, // g
                (int & 0xF) * 17, // b
                255 // a
            )
        case 6: // RGB (24-bit)
            (r, g, b, a) = (
                int >> 16, // r
                int >> 8 & 0xFF, // g
                int & 0xFF, // b
                255 // a
            )
        case 8: // RGBA (32-bit)
            (r, g, b, a) = (
                int >> 24, // r
                int >> 16 & 0xFF, // g
                int >> 8 & 0xFF, // b
                int & 0xFF // a
            )
        default:
            return nil
        }

        self.init(
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }


    /// `UIColor` to RGB HEX `String`
    ///
    /// - Parameter opacity: Include the opacity component
    func hexString(opacity: Bool = true) -> String {
        let rgba = self.rgba

        var hex = String(
            format: "#%02X%02X%02X",
            rgba.red.int255,
            rgba.green.int255,
            rgba.blue.int255
        )

        if opacity {
            hex += String(format: "%02X", rgba.opacity.int255)
        }

        return hex
    }
}

// MARK: - Double + Color

private extension Double {

    /// Convert to integer 255 color component
    var int255: Int {
        return Int((self * 255).rounded())
    }
}
