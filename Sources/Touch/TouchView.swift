//
//  TouchView.swift
//  SwiftUIExtensions
//
//  Created by Ben Shutt on 18/01/2022.
//

#if canImport(UIKit)
import SwiftUI

/// `UIViewRepresentable` creating a `TouchUIView` to forward touch events
struct TouchView: UIViewRepresentable {

    /// Touch callback
    var onTouch: TouchUIView.Callback?

    // MARK: - UIViewRepresentable

    func makeUIView(context: Context) -> TouchUIView {
        let view = TouchUIView()
        view.onTouch = onTouch
        return view
    }

    func updateUIView(_ uiView: TouchUIView, context: Context) {
        // do nothing
    }
}
#endif
