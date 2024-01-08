//
//  LoginButtonsView.swift
//  JobSpot
//
//  Created by Enigma Kod on 06/01/2024.
//

import UIKit

final class LoginButtonsView: UIView {
    private let loginButton = BaseButton(viewModel: .init(type: .primary, title: "Login"))

    private let vStack = stackView(spacing: 15)

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
    public func style() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    public func layout() {
        vStack.addArrangedSubview(loginButton)

        addSubview(vStack)
    }
}
