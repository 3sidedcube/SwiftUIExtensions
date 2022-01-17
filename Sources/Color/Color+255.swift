//
//  Color+255.swift
//  SwiftUIExtensions
//
//  Created by Ben Shutt on 17/01/2022.
//

import SwiftUI

public extension Color {

    /// Shorthand for creating a `UIColor` with RGBA ranges in [0, 255].
    ///
    /// - Note:
    /// Named consistently with `init(displayP3Red:green:blue:alpha:)`
    ///
    /// - Parameters:
    ///   - red: Red component in [0, 255]
    ///   - green: Green component in [0, 255]
    ///   - blue: Blue component in [0, 255]
    ///   - opacity: Opacity component in [0, 255]
    init(
        red255 red: Double,
        green: Double,
        blue: Double,
        opacity: Double = 255
    ) {
        self.init(
            red: red / 255,
            green: green / 255,
            blue: blue / 255,
            opacity: opacity / 255
        )
    }

    /// Shorthand for creating a `UIColor` with white in [0, 255].
    ///
    /// - Parameters:
    ///   - white: White component in [0, 255]
    ///   - opacity: Opacity component in [0, 255]
    init(
        white255 white: Double,
        opacity: Double = 255
    ) {
        self.init(
            white: white / 255,
            opacity: opacity / 255
        )
    }
}
