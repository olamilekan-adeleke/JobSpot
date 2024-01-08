//
//  ForgetPasswordView.swift
//  JobSpot
//
//  Created by Enigma Kod on 08/01/2024.
//

import UIKit

final class ForgetPasswordView: UIView {
    private let headerWithImage = ForgotPasswordHeaderWithImageView()
    private let formsAndButton = ForgotPasswordFieldsAndButton()

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

extension ForgetPasswordView {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    private func layout() {
        vStack.addArrangedSubview(headerWithImage)

        vStack.setCustomSpacing(150, after: headerWithImage)
        vStack.addArrangedSubview(formsAndButton)

        addSubview(vStack)

        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AppSize.kGobalPadding),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -AppSize.kGobalPadding),
        ])
    }
}
