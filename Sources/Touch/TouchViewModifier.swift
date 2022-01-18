//
//  TouchViewModifier.swift
//  SwiftUIExtensions
//
//  Created by Ben Shutt on 18/01/2022.
//

import SwiftUI

/// `ViewModifier` overlaying a `TouchView`
struct TouchViewModifier: ViewModifier {

    /// Touch callback handler
    var onTouch: TouchUIView.Callback

    // MARK: - ViewModifier

    func body(content: Content) -> some View {
        content.overlay(TouchView(onTouch: onTouch))
    }
}

// MARK: - View + ViewModifier

extension View {

    /// Add touch callback handler
    ///
    /// - Parameter onTouch: `TouchUIView.Callback`
    /// - Returns: Some `View`
    func onTouch(_ onTouch: @escaping TouchUIView.Callback) -> some View {
        modifier(TouchViewModifier(onTouch: onTouch))
    }
}
