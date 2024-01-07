//
//  LoginView.swift
//  JobSpot
//
//  Created by Enigma Kod on 06/01/2024.
//

import UIKit

class LoginView: UIView {
    private let header = LoginHeaderView()
    private let loginForm = LogicFormsView()

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

extension LoginView {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    private func layout() {
        addSubview(vStack)

        vStack.addArrangedSubview(header)
        vStack.setCustomSpacing(40, after: header)
        vStack.addArrangedSubview(loginForm)

        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
//            vStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AppSize.kGobalPadding),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -AppSize.kGobalPadding),
        ])
    }
}
