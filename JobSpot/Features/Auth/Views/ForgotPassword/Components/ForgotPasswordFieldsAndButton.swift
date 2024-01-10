//
//  ForgotPasswordFieldsAndButton.swift
//  JobSpot
//
//  Created by Enigma Kod on 08/01/2024.
//

import UIKit

class ForgotPasswordFieldsAndButton: UIView {
    private let emailForm = EmailTextField(placeHolder: "E.g Kod@enigma.com")
    private let submitButton = BaseButton(viewModel: .init(type: .primary, title: "Reset Password"))

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

extension ForgotPasswordFieldsAndButton {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false

        submitButton.setOnTap(UITapGestureRecognizer(target: self, action: #selector(onButtonTapped)))
    }

    private func layout() {
        vStack.addArrangedSubview(emailForm)

        vStack.setCustomSpacing(40, after: emailForm)
        vStack.addArrangedSubview(submitButton)

        addSubview(vStack)
        vStack.pinToEdges(to: self)
    }

    @objc private func onButtonTapped() {
        pushToVc(vc: ResetPasswordVC())
    }
}
