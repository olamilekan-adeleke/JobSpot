//
//  CustomTextField.swift
//  JobSpot
//
//  Created by Enigma Kod on 09/12/2023.
//

import UIKit

final class CustomTextField: UIView {
    // MARK: - Components

    lazy var textField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = UIColor.label
        textField.delegate = self
        return textField
    }()

    private lazy var textFieldBackgroundView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.black.withAlphaComponent(0.125)
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Properties

    private var viewModel: ViewModel
    private var focusState: FocusState = .inactive {
        didSet { updateBorder() }
    }

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)

        setUp()
        layout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Set Up & Layout

extension CustomTextField {
    private func setUp() {
        textField.isSecureTextEntry = viewModel.isSecure
        textField.autocapitalizationType = viewModel.autoCap
        textField.placeholder = viewModel.placeHolder
        textField.keyboardType = viewModel.keyBoardType

        textFieldBackgroundView.addSubview(textField)
        addSubview(textFieldBackgroundView)
    }

    private func layout() {
        translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            textFieldBackgroundView.leftAnchor.constraint(equalTo: leftAnchor),
            textFieldBackgroundView.rightAnchor.constraint(equalTo: rightAnchor),
            textFieldBackgroundView.topAnchor.constraint(equalTo: textField.topAnchor, constant: -9),
            textFieldBackgroundView.bottomAnchor.constraint(equalTo: textField.bottomAnchor, constant: 9),

            textField.leftAnchor.constraint(equalTo: textFieldBackgroundView.leftAnchor, constant: 6),
            textField.rightAnchor.constraint(equalTo: textFieldBackgroundView.rightAnchor, constant: -6),

            heightAnchor.constraint(equalTo: textFieldBackgroundView.heightAnchor),
        ])
    }

    private func updateBorder() {
        textFieldBackgroundView.layer.borderColor = focusState.borderColor
        textFieldBackgroundView.layer.borderWidth = focusState.borderWidth
    }
}

// MARK: - Foucus State

extension CustomTextField {
    enum FocusState { case active, inactive

        var borderColor: CGColor? {
            return self == .active ? UIColor.black.withAlphaComponent(0.6).cgColor : .none
        }

        var borderWidth: CGFloat { return self == .active ? 1 : 0 }
    }
}

// MARK: - UITextFieldDelegate

extension CustomTextField: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        focusState = .active
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        focusState = .inactive
    }
}
