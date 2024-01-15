//
//  JobDetailFacilitiesView.swift
//  JobSpot
//
//  Created by Enigma Kod on 16/01/2024.
//

import UIKit

class JobDetailFacilitiesView: UIView {
    private let facilitiesStack = stackView(spacing: 10)
    private let facilitiesHeaderLabel = Label(type: .bold)
    private let facilitiesList = [
        "Medical", "Dental", "Technical Cartification", "Meal Allowance", "Meal Allowance",
        "Regular Hours", "Mondays-Fridays",
    ]

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

extension JobDetailFacilitiesView {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false

        facilitiesHeaderLabel.text = "Facilities and Others"
        facilitiesHeaderLabel.font = .systemFont(ofSize: 14, weight: .bold)
    }

    private func layout() {
        facilitiesStack.addArrangedSubview(facilitiesHeaderLabel)
        for option in facilitiesList {
            let optionLabel = RequirementTextView(text: option)
            facilitiesStack.addArrangedSubview(optionLabel)
        }

        addSubview(facilitiesStack)
        NSLayoutConstraint.activate([
            facilitiesStack.topAnchor.constraint(equalTo: topAnchor),
            facilitiesStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AppSize.horizontalPadding),
            facilitiesStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -AppSize.horizontalPadding),
            facilitiesStack.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
