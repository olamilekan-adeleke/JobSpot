//
//  ResetPaswordTextFieldAndButton.swift
//  JobSpot
//
//  Created by Enigma Kod on 08/01/2024.
//

import UIKit

class ResetPasswordTextFieldAndButton: UIView {
    private let emailForm = CodeTextField(placeHolder: "E.g Kod@enigma.com")
    private let submitButton = BaseButton(viewModel: .init(type: .primary, title: "Submit Code"))
    private let resendCodeLabel = Label(type: .thin)
    
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

extension ResetPasswordTextFieldAndButton {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        submitButton.setOnTap(UITapGestureRecognizer(target: self, action: #selector(onButtonTapped)))
        
        resendCodeLabel.textAlignment = .center
        resendCodeLabel.font = .systemFont(ofSize: 12, weight: .thin)
        
        let questionString = NSMutableAttributedString(string: "You have not received the email? ", attributes: [
            .font: UIFont.systemFont(ofSize: 12, weight: .thin),
        ])
        let signUpString = NSMutableAttributedString(string: "Resend", attributes: [
            .font: UIFont.systemFont(ofSize: 12, weight: .thin),
            .foregroundColor: UIColor(red: 0.99, green: 0.64, blue: 0.3, alpha: 1),
            .underlineColor: UIColor(red: 0.99, green: 0.64, blue: 0.3, alpha: 1),
            .underlineStyle: NSUnderlineStyle.single.rawValue,
        ])
        
        questionString.append(signUpString)
        resendCodeLabel.attributedText = questionString
    }
    
    private func layout() {
        vStack.addArrangedSubview(emailForm)
        
        vStack.setCustomSpacing(30, after: emailForm)
        vStack.addArrangedSubview(submitButton)
        
        vStack.setCustomSpacing(10, after: submitButton)
        vStack.addArrangedSubview(resendCodeLabel)
        
        addSubview(vStack)
        vStack.pinToEdges(to: self)
    }
    
    @objc private func onButtonTapped() {
//        pushToVc(vc: ResetPasswordVC())
    }
}
