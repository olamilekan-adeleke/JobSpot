//
//  PasswordTextField.swift
//  JobSpot
//
//  Created by Enigma Kod on 07/01/2024.
//

import UIKit
import Combine

class PasswordTextField: UIView {
    private let textField = BaseTextField(viewModel: .init(type: .password))
    private let title = Label(type: .regular)
    private let vStack = stackView(spacing: 5)
    
    var text: String? { textField.textField.text }
    var validationState: Published<FormValidationState>.Publisher { textField.$validationState }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUp()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        title.text = "Password"
        
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
