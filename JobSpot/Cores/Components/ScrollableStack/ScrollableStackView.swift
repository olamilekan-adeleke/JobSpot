//
//  ScrollableStackView.swift
//  JobSpot
//
//  Created by Enigma Kod on 10/01/2024.
//

import UIKit

public class ScrollableStackView: UIView {
    // MARK: Properties
    
    private var didSetupConstraints = false
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.backgroundColor = .clear
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.layoutMargins = .zero
        return scrollView
    }()
    
    private lazy var stack: UIStackView = stackView()
//    private lazy var stackView: UIStackView = {
//        let stackView = UIStackView(frame: .zero)
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = .vertical
//        stackView.alignment = .fill
//        stackView.distribution = .fill
//        return stackView
//    }()
    
    // MARK: Life Cycle
    
    override public func didMoveToSuperview() {
        super.didMoveToSuperview()
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        addSubview(scrollView)
        scrollView.addSubview(stack)
        setNeedsUpdateConstraints()
    }
    
    override public func updateConstraints() {
        super.updateConstraints()
        if !didSetupConstraints {
            NSLayoutConstraint.activate([
                scrollView.topAnchor.constraint(equalTo: topAnchor),
                scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
                scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
                stack.topAnchor.constraint(equalTo: scrollView.topAnchor),
                stack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                stack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                stack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                stack.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            ])
            didSetupConstraints.toggle()
        }
    }
}

// MARK: - ScrollableStackView - Actions

public extension ScrollableStackView {
    /// Adds a view to the end of the arranged subviews array.
    ///
    /// - Parameter view: The view to be added to the array of views arranged by the stack.
    func add(view: UIView) {
        stack.addArrangedSubview(view)
    }
    
    /// Adds the provided view to the array of arranged subviews at the specified index.
    ///
    /// - Parameters:
    ///   - view: The view to be added to the array of views arranged by the stack.
    ///   - index: The index where the stack inserts the new view in its arranged subviews array.
    ///     This value must not be greater than the number of views currently in this array.
    ///     If the index is out of bounds, this method throws an `internalInconsistencyException` exception.
    func insert(view: UIView, at index: Int) {
        stack.insertArrangedSubview(view, at: index)
    }
    
    /// Removes the provided view from the stack’s array of arranged subviews.
    ///
    /// - Parameter view: The view to be removed from the array of views arranged by the stack.
    func remove(view: UIView) {
        stack.removeArrangedSubview(view)
    }
   
    func setCustomSpacing(_ spacing: CGFloat, after arrangedSubview: UIView) {
        stack.setCustomSpacing(spacing, after: arrangedSubview)
    }
}

// MARK: - ScrollableStackView - Configuration

public extension ScrollableStackView {
    /// The distance in points between the adjacent edges of the stack view’s arranged views.
    ///
    /// This property defines a strict spacing between arranged views for the `UIStackView.Distribution.fillProportionally` distributions.
    /// It represents the minimum spacing for the `UIStackView.Distribution.equalSpacing` and `UIStackView.Distribution.equalCentering` distributions.
    /// Use negative values to allow overlap.
    /// The default value is `0.0`.
    var spacing: CGFloat {
        get { stack.spacing }
        set { stack.spacing = newValue }
    }
    
    /// The alignment of the arranged subviews perpendicular to the stack view’s axis.
    ///
    /// This property determines how the stack view lays out its arranged views perpendicularly to its axis.
    /// The default value is `UIStackView.Alignment.fill`.
    /// For a list of possible values, see `UIStackView.Alignment`.
    var alignment: UIStackView.Alignment {
        get { stack.alignment }
        set { stack.alignment = newValue }
    }
    
    /// The distribution of the arranged views along the stack view’s axis.
    ///
    /// This property determines how the stack view lays out its arranged views along its axis.
    /// The default value is `UIStackView.Distribution.fill`.
    /// For a list of possible values, see `UIStackView.Distribution`.
    var distribution: UIStackView.Distribution {
        get { stack.distribution }
        set { stack.distribution = newValue }
    }
    
    /// A Boolean value that controls whether the vertical scroll indicator is visible.
    ///
    /// The default value is `true`. The indicator is visible while tracking is underway and fades out after tracking.
    var showsVerticalScrollIndicator: Bool {
        get { scrollView.showsVerticalScrollIndicator }
        set { scrollView.showsVerticalScrollIndicator = newValue }
    }
    
    /// A Boolean value that controls whether the scroll view bounces past the edge of content and back again.
    ///
    /// If the value of this property is `true`, the scroll view bounces when it encounters a boundary of the content.
    /// Bouncing visually indicates that scrolling has reached an edge of the content.
    /// If the value is `false`, scrolling stops immediately at the content boundary without bouncing.
    /// The default value is `true`.
    var bounces: Bool {
        get { scrollView.bounces }
        set { scrollView.bounces = newValue }
    }
}
