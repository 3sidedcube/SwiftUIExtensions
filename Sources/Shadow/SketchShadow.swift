//
//  SketchShadow.swift
//  SwiftUIExtensions
//
//  Created by Ben Shutt on 17/01/2022.
//

import SwiftUI

/// Model based on Sketch shadow properties.
///
/// - Note:
/// Opacity/alpha is handled in the `color`
public struct SketchShadow {

    /// Shadow color
    public var color: Color

    /// Shadow offset in x
    public var x: Points

    /// Shadow offset in y
    public var y: Points

    /// Shadow blur (2 * shadow radius)
    public var blur: Points

    /// Shadow spread
    public var spread: Points

    // MARK: - Init

    /// Default public memberwise initializer
    ///
    /// - Parameters:
    ///   - color: `Color`
    ///   - x: `Points`
    ///   - y: `Points`
    ///   - blur: `Points`
    ///   - spread: `Points`
    public init(
        color: Color,
        x: Points,
        y: Points,
        blur: Points,
        spread: Points
    ) {
        self.color = color
        self.x = x
        self.y = y
        self.blur = blur
        self.spread = spread
    }
}

// MARK: - Default

public extension SketchShadow {

    /// `SketchShadow` with the default shadow properties
    static var `default`: SketchShadow {
        return SketchShadow(
            color: .black.opacity(0), x: 0, y: -3, blur: 6, spread: 0
        )
    }
}
