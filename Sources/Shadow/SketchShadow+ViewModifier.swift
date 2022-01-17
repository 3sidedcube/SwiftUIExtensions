//
//  SketchShadow+ViewModifier.swift
//  SwiftUIExtensions
//
//  Created by Ben Shutt on 17/01/2022.
//

import SwiftUI

extension SketchShadow: ViewModifier {

    // TODO: Spread not used
    public func body(content: Content) -> some View {
        content.shadow(color: color, radius: blur * 0.5, x: x, y: y)
    }
}

extension View {

    func shadow(_ sketchShadow: SketchShadow) -> some View {
        modifier(sketchShadow)
    }
}
