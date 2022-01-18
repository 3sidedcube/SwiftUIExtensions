//
//  ShadowViewModifier.swift
//  SwiftUIExtensions
//
//  Created by Ben Shutt on 17/01/2022.
//

import SwiftUI

/// `ViewModifier` which draws a shadow background
///
/// - Note:
/// In order to achieve a continuous effect, the corner radius might need to be proportionally greater.
struct ShadowViewModifier: ViewModifier {

    /// `Shadow` properties
    var shadow: Shadow

    /// Corner radius in `Points`
    var cornerRadius: Points

    // MARK: - View

    /// `View` to draw `Shadow` with `cornerRadius`
    private func shadowView() -> some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .inset(by: -shadow.spread)
            .fill(shadow.color)
            .blur(radius: shadow.blur, opaque: false)
            .shadow(
                color: shadow.color,
                radius: shadow.blur * 2,
                x: shadow.x,
                y: shadow.y
            )
    }

    // MARK: - ViewModifier

    func body(content: Content) -> some View {
        return content.background(shadowView())
    }
}

// MARK: - View + ShadowViewModifier
    
extension View {

    func shadow(_ shadow: Shadow, cornerRadius: Points = 0) -> some View {
        modifier(ShadowViewModifier(shadow: shadow, cornerRadius: cornerRadius))
    }
}

// MARK: - PreviewProvider

struct ShadowView_Previews: PreviewProvider {

    private static var cornerRadius: Points {
        return 10
    }

    private static var size: Points {
        return 100
    }

    private static func roundedRectangle(
        inset: Points,
        color: Color
    ) -> some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .inset(by: inset)
            .fill(color)
    }

    static var previews: some View {
        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
            .fill(Color.white)
            .frame(width: size, height: size, alignment: .center)
            .background(roundedRectangle(inset: -5, color: .red))
            .shadow(Shadow(
                color: .black.opacity(0.5),
                x: 0,
                y: 2,
                blur: 5,
                spread: 20
            ), cornerRadius: cornerRadius)
            .background(roundedRectangle(inset: -10, color: .blue))
    }
}
