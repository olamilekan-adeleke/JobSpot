//
//  BaseTextField.swift
//  CustomTextField
//
//  Created by Enigma Kod on 26/12/2023.
//

import Combine
import SwiftUI
import UIKit

final class BaseTextField: UIView {
    // MARK: -  Component

    lazy var textField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.textColor = UIColor.label
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var textFieldBackgroundView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.black.withAlphaComponent(0.055)
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var errorLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 14, weight: .thin)
        label.textColor = .systemRed
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var vStack = stackView(spacing: 10)

    // MARK: - Properties

    private let viewModel: ViewModel

    private var subscriptions = Set<AnyCancellable>()
    @Published var validationState: FormValidationState = .idel
    private var focusState: FocusState = .inactive {
        didSet { updateBorder() }
    }

    // MARK: - Lifecycle

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(frame: CGRect.zero)

        setUp()
        layout()

        listenForStateChanges()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMoveToWindow() {
        startValidation()
    }

    private func setUp() {
        textField.isSecureTextEntry = viewModel.isSecure
        textField.autocapitalizationType = viewModel.autoCap
        textField.placeholder = viewModel.placeHolder
        textField.keyboardType = viewModel.keyboard

        errorLabel.numberOfLines = 0
        errorLabel.textAlignment = .left
        errorLabel.textColor = .systemRed
        errorLabel.isHidden = true
        errorLabel.font = .systemFont(ofSize: 10, weight: .thin)
    }

    private func layout() {
        translatesAutoresizingMaskIntoConstraints = false

        textFieldBackgroundView.addSubview(textField)
        addSubview(vStack)

        vStack.addArrangedSubview(textFieldBackgroundView)
        vStack.addArrangedSubview(errorLabel)

        NSLayoutConstraint.activate([
            textFieldBackgroundView.widthAnchor.constraint(equalTo: widthAnchor),

            textFieldBackgroundView.topAnchor.constraint(equalTo: textField.topAnchor, constant: -9),
            textFieldBackgroundView.bottomAnchor.constraint(equalTo: textField.bottomAnchor, constant: 9),

            textField.leftAnchor.constraint(equalTo: textFieldBackgroundView.leftAnchor, constant: 6),
            textField.rightAnchor.constraint(equalTo: textFieldBackgroundView.rightAnchor, constant: -6),

            heightAnchor.constraint(equalTo: vStack.heightAnchor),

            errorLabel.widthAnchor.constraint(equalTo: widthAnchor),
        ])
    }
}

// MARK: - State Change

extension BaseTextField {
    enum FocusState { case active, inactive

        var borderColor: CGColor? {
            return self == .active ? UIColor.black.withAlphaComponent(0.6).cgColor : .none
        }

        var borderWidth: CGFloat { return self == .active ? 1 : 0 }
    }

    private func validationStateChanged(state: FormValidationState) {
        switch state {
            case .idel: break
            case .invaild(let errorState):
                errorLabel.text = errorState.description
                errorLabel.isHidden = false
            case .valid:
                errorLabel.text = ""
                errorLabel.isHidden = true
        }
    }

    private func listenForStateChanges() {
        $validationState.receive(on: RunLoop.main)
            .sink { [weak self] state in
                self?.validationStateChanged(state: state)
            }
            .store(in: &subscriptions)
    }

    private func updateBorder() {
        textFieldBackgroundView.layer.borderColor = focusState.borderColor
        textFieldBackgroundView.layer.borderWidth = focusState.borderWidth
    }
}

extension BaseTextField {
    private func startValidation() {
        let validatable = FormValidatableFactory.validatableForType(type: viewModel.type)

        textField.textFieldTextPublisher()
            .removeDuplicates()
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .validateText(validator: validatable)
            .assign(to: &$validationState)
    }
}

// MARK: - UITextFieldDelegate

extension BaseTextField: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        focusState = .active
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        focusState = .inactive
    }
}
