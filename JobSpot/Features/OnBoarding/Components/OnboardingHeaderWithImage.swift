//
//  OnboardingHeaderWithImage.swift
//  JobSpot
//
//  Created by Enigma Kod on 09/11/2023.
//

import UIKit

class OnboardingHeaderWithImage: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)

        style()
        layout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
}

extension OnboardingHeaderWithImage {
    public func style() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    public func layout() {}
}
