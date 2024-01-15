//
//  JobDetailsButtonView.swift
//  JobSpot
//
//  Created by Enigma Kod on 16/01/2024.
//

import UIKit

class JobDetailsButtonView: UIView {
    private let vStack = stackView()
    private let applyButton = BaseButton(viewModel: .init(type: .primary, title: "Apply Now"))

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

extension JobDetailsButtonView {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    private func layout() {
        vStack.addArrangedSubview(applyButton)
        
        addSubview(vStack)
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: topAnchor),
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AppSize.horizontalPadding),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -AppSize.horizontalPadding),
            vStack.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
