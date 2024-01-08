//
//  BaseButton.swift
//  JobSpot
//
//  Created by Enigma Kod on 07/01/2024.
//

import UIKit

final class BaseButton: UIView {
    private let viewModel: ViewModel
    private let button = UIButton()

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)

        style()
        layout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BaseButton {
    public func style() {
        translatesAutoresizingMaskIntoConstraints = false

        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        button.clipsToBounds = true

        button.backgroundColor = viewModel.backgroundColor
        button.setTitle(viewModel.title, for: .normal)
    }

    public func layout() {
        addSubview(button)

        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 45),
            widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32),

            button.centerXAnchor.constraint(equalTo: centerXAnchor),

            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: button.trailingAnchor),
            button.topAnchor.constraint(equalTo: topAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
