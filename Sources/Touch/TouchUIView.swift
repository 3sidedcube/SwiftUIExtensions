//
//  TouchUIView.swift
//  SwiftUIExtensions
//
//  Created by Ben Shutt on 18/01/2022.
//

import UIKit

/// `UIView` which forwards touch events with a callback closure.
///
/// - Note:
/// The callback is only called:
/// - with the location of the *first* touch
/// - when that location is within `bounds`
class TouchUIView: UIView {
    typealias Callback  = (TouchType, CGPoint) -> Void

    /// The type of touch callbacks
    enum TouchType {

        /// Callback received from `touchesBegan(_:with:)`
        case began

        /// Callback received from `touchesMoved(_:with:)`
        case moved

        /// Callback received from `touchesEnded(_:with:)`
        case ended

        /// Callback received from `touchesCancelled(_:with:)`
        case cancelled
    }

    /// Callback with the location of the *first* touch
    var onTouch: Callback?

    // MARK: - Init

    /// Initialize with `frame`
    ///
    /// - Parameter frame: `CGRect`
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    /// Initialize with `coder`
    ///
    /// - Parameter coder: `NSCoder`
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    /// Shared initializer functionality
    private func setup() {
        isUserInteractionEnabled = true
    }

    // MARK: - Touches

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        update(.began, touches: touches, with: event)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        update(.moved, touches: touches, with: event)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        update(.ended, touches: touches, with: event)
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        update(.cancelled, touches: touches, with: event)
    }

    // MARK: - Callback

    /// Invoked when a touch event is called with `touches` and `event`
    ///
    /// - Parameters:
    ///   - type: `TouchType`
    ///   - touches: `Set<UITouch>`
    ///   - event: `UIEvent`
    private func update(_ type: TouchType, touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        guard bounds.contains(location) else { return }
        onTouch?(type, location)
    }
}
