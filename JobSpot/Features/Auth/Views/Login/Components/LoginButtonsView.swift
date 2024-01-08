//
//  LoginButtonsView.swift
//  JobSpot
//
//  Created by Enigma Kod on 06/01/2024.
//

import UIKit

final class LoginButtonsView: UIView {
    private let loginButton = BaseButton(viewModel: .init(type: .primary, title: "Login"))
    private let googleLoginButton = BaseButton(viewModel: .init(type: .secondary, title: "Login With Google"))
    private let createAccountLabel = Label(type: .thin)

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

extension LoginButtonsView {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false

        createAccountLabel.textAlignment = .center
        createAccountLabel.font = .systemFont(ofSize: 12, weight: .thin)

        let questionString = NSMutableAttributedString(string: "You don't have an account yet? ", attributes: [
            .font: UIFont.systemFont(ofSize: 12, weight: .thin),
        ])
        let signUpString = NSMutableAttributedString(string: "Sign Up", attributes: [
            .font: UIFont.systemFont(ofSize: 12, weight: .thin),
            .foregroundColor: UIColor(red: 0.99, green: 0.64, blue: 0.3, alpha: 1),
            .underlineColor: UIColor(red: 0.99, green: 0.64, blue: 0.3, alpha: 1),
            .underlineStyle: NSUnderlineStyle.single.rawValue,
        ])

        questionString.append(signUpString)
        createAccountLabel.attributedText = questionString
    }

    private func layout() {
        vStack.addArrangedSubview(loginButton)
        vStack.setCustomSpacing(15, after: loginButton)
        vStack.addArrangedSubview(googleLoginButton)
        vStack.setCustomSpacing(10, after: googleLoginButton)
        vStack.addArrangedSubview(createAccountLabel)

        addSubview(vStack)

        loginButton.setOnTap(UITapGestureRecognizer(target: self, action: #selector(loginWithEmail)))
        googleLoginButton.setOnTap(UITapGestureRecognizer(target: self, action: #selector(loginWithGoogle)))
    }

    @objc private func loginWithEmail() {}

    @objc private func loginWithGoogle() {}
}
