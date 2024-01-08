//
//  ResetPasswordHeaderWidget.swift
//  JobSpot
//
//  Created by Enigma Kod on 08/01/2024.
//

import UIKit

class ResetPasswordHeaderWidget: UIView {
    private let title = Label(type: .bold)
    private let subtitle = Label(type: .regular)
    private let imageView = CustomImageView(image: UIImage(named: "reset_password_image"))
    
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

extension ResetPasswordHeaderWidget {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        title.text = "Check Your Email"
        title.font = .systemFont(ofSize: 30, weight: .bold)
        title.textAlignment = .center
        
        subtitle.text = "We have sent the reset password code to the email address brandonelouis@gmial.com"
        subtitle.font = .systemFont(ofSize: 12, weight: .thin)
        subtitle.numberOfLines = 0
        subtitle.textAlignment = .center
    }
    
    private func layout() {
        vStack.addArrangedSubview(title)
        vStack.setCustomSpacing(5, after: title)
        
        vStack.addArrangedSubview(subtitle)
        vStack.setCustomSpacing(50, after: subtitle)
        
        vStack.addArrangedSubview(imageView)
//        NSLayoutConstraint.activate([
//            imageView.widthAnchor.constraint(equalToConstant: 118),
//            imageView.heightAnchor.constraint(equalToConstant: 94),
//        ])
        
        addSubview(vStack)
        vStack.pinEdges(to: self)
    }
}
