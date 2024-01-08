//
//  LoginHeaderView.swift
//  JobSpot
//
//  Created by Enigma Kod on 06/01/2024.
//

import UIKit

class LoginHeaderView: UIView {
    let title = Label(type: .bold)
    let subtitle = Label(type: .regular)

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

extension LoginHeaderView {
    public func style() {
        translatesAutoresizingMaskIntoConstraints = false

        title.text = "Welcome Back"
        title.font = .systemFont(ofSize: 30, weight: .bold)
        title.textAlignment = .center

        subtitle.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"
        subtitle.font = .systemFont(ofSize: 12, weight: .thin)
        subtitle.numberOfLines = 0
        subtitle.textAlignment = .center
    }

    public func layout() {
        addSubview(title)
        addSubview(subtitle)

        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),

            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 0),
            subtitle.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: subtitle.trailingAnchor),
            subtitle.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
