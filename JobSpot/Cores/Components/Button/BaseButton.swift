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
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setOnTap(_ gestureRecognizer: UITapGestureRecognizer) {
        button.addGestureRecognizer(gestureRecognizer)
    }

    func setImage(_ image: UIImage) {
        button.setImage(image, for: .normal)
//        button.
    }
}

extension BaseButton {
    public func style() {
        translatesAutoresizingMaskIntoConstraints = false

        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        button.clipsToBounds = true

        button.backgroundColor = viewModel.backgroundColor
        button.titleLabel?.font = viewModel.type == .iconButton ? .systemFont(ofSize: 14, weight: .light) : UIFont.boldSystemFont(ofSize: 16)
        button.setTitle(viewModel.title, for: .normal)
        button.setTitleColor(viewModel.textColor, for: .normal)
    }

    public func layout() {
        addSubview(button)

        if viewModel.type == .iconButton {
            button.heightAnchor.constraint(equalToConstant: 40).isActive = true
            widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2) - 32).isActive = true
        }
        else {
            button.heightAnchor.constraint(equalToConstant: 45).isActive = true
            widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32).isActive = true
        }

        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: centerXAnchor),

            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: button.trailingAnchor),
            button.topAnchor.constraint(equalTo: topAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
