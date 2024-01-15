//
//  JobDetailDescriptionAndRequirements.swift
//  JobSpot
//
//  Created by Enigma Kod on 15/01/2024.
//

import UIKit

class JobDetailDescriptionAndRequirements: UIView {
    private let vStack = stackView()
    

    override init(frame: CGRect) {
        super.init(frame: frame)

        style()
        layout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension JobDetailDescriptionAndRequirements {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    private func layout() {}
}
