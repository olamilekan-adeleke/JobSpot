//
//  JobDetailsTagView.swift
//  JobSpot
//
//  Created by Enigma Kod on 15/01/2024.
//

import UIKit

class JobDetailsTagView: UIView {
    private let hStack = stackView(axis: .horizontal, spacing: 15)
    private let salaryView = TagView(title: "$15/Mo")
    private let jobTypeView = TagView(title: "Remote")
    private let positionView = TagView(title: "Seinor Designer")

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

extension JobDetailsTagView {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false

        hStack.distribution = .fillProportionally
    }

    private func layout() {
        hStack.addArrangedSubview(salaryView)
        hStack.addArrangedSubview(jobTypeView)
        hStack.addArrangedSubview(positionView)

        addSubview(hStack)
        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: topAnchor),
            hStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AppSize.horizontalPadding),
            hStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -AppSize.horizontalPadding),
            hStack.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
