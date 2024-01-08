//
//  ResetPasswordVC.swift
//  JobSpot
//
//  Created by Enigma Kod on 08/01/2024.
//

import UIKit

class ResetPasswordView: UIView {
    private let headerView = ResetPasswordHeaderWidget()
    private let codeTextField = ResetPasswordTextFieldAndButton()

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

extension ResetPasswordView {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    private func layout() {
        vStack.addArrangedSubview(headerView)
        
        vStack.setCustomSpacing(150, after: headerView)
        vStack.addArrangedSubview(codeTextField)

        addSubview(vStack)
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AppSize.kGobalPadding),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -AppSize.kGobalPadding),
        ])
    }
}
