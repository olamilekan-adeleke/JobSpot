//
//  SpacerView.swift
//  JobSpot
//
//  Created by Enigma Kod on 07/01/2024.
//

import UIKit

final class SpacerView: UIView {
    var height: CGFloat?
    var width: CGFloat?

    init(height: CGFloat? = nil, width: CGFloat? = nil) {
        super.init(frame: .zero)
        self.height = height
        self.width = width

        let view = UIView()

        addSubview(view)

        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: height ?? 0),
            view.widthAnchor.constraint(equalToConstant: width ?? 0),
        ])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
