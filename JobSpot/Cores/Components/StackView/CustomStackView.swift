//
//  CustomStackView.swift
//  JobSpot
//
//  Created by Enigma Kod on 09/12/2023.
//

import UIKit

func stackView(axis: NSLayoutConstraint.Axis = .vertical, spacing: CGFloat = 10) -> UIStackView {
    let stack = UIStackView(frame: .zero)
    stack.axis = axis
    stack.spacing = spacing
    stack.translatesAutoresizingMaskIntoConstraints = false
    return stack
}
