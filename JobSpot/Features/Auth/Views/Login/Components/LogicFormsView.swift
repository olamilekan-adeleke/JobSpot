//
//  LogicFormsView.swift
//  JobSpot
//
//  Created by Enigma Kod on 06/01/2024.
//

import UIKit

final class LogicFormsView: UIView {
    let emailTextField = EmailTextField()
    let passwordTextField = PasswordTextField()
    @objc let forgotPasswordText = Label(type: .regular)
    let vStack = stackView(spacing: 15)

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

extension LogicFormsView {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false

        let textString = NSMutableAttributedString(string: "Forgot Password ?", attributes: [
            .font: UIFont.systemFont(ofSize: 12, weight: .thin),
            .foregroundColor: UIColor.black,
            .underlineColor: UIColor.black,
            .underlineStyle: NSUnderlineStyle.single.rawValue,
        ])
        forgotPasswordText.attributedText = textString
        forgotPasswordText.textAlignment = .right
        forgotPasswordText.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(forgotPasswordTapped))
        )
    }

    private func layout() {
        vStack.addArrangedSubview(emailTextField)
        vStack.addArrangedSubview(passwordTextField)
        vStack.addArrangedSubview(forgotPasswordText)

        addSubview(vStack)

        NSLayoutConstraint.activate([
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            vStack.topAnchor.constraint(equalTo: topAnchor),
            vStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            trailingAnchor.constraint(equalTo: vStack.trailingAnchor),
        ])
    }

    @objc func forgotPasswordTapped() {
        pushToVc(vc: ForgotPasswordVC())
    }
}
