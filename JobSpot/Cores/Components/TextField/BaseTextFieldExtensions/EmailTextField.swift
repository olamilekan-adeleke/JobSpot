//
//  EmailTextField.swift
//  JobSpot
//
//  Created by Enigma Kod on 07/01/2024.
//

import Combine
import UIKit

class EmailTextField: UIView {
    private let textField: BaseTextField
    private let title = Label(type: .regular)
    private let vStack = stackView(spacing: 5)

    var text: String? { textField.textField.text }
    var validationState: Published<FormValidationState>.Publisher { textField.$validationState }

    init(placeHolder: String? = nil) {
        textField = BaseTextField(viewModel: .init(type: .email, placeHolder: placeHolder))
        super.init(frame: .zero)

        setUp()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUp() {
        title.text = "Email"

        vStack.addArrangedSubview(title)
        vStack.addArrangedSubview(textField)

        addSubview(vStack)

        NSLayoutConstraint.activate([
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            vStack.topAnchor.constraint(equalTo: topAnchor),
            vStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            trailingAnchor.constraint(equalTo: vStack.trailingAnchor),
        ])
    }
}
