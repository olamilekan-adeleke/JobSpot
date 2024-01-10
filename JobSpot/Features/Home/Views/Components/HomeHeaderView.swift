//
//  HomeHeaderView.swift
//  JobSpot
//
//  Created by Enigma Kod on 10/01/2024.
//

import UIKit

class HomeHeaderView: UIView {
    private let greetingLabel = Label(type: .bold, str: "Hello \nKod Enigma")
    private let userImage = ImageView(image: UIImage())
    private let hStack = stackView(axis: .horizontal)

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

extension HomeHeaderView {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false

        hStack.alignment = .center

        greetingLabel.font = .systemFont(ofSize: 22, weight: .bold)
        greetingLabel.textAlignment = .left
        greetingLabel.numberOfLines = 0

        userImage.backgroundColor = .yellow
        userImage.layer.cornerRadius = 42 / 2
        userImage.image = UIImage(named: "person")
        userImage.clipsToBounds = true
        userImage.contentMode = .scaleAspectFill
    }

    private func layout() {
        hStack.addArrangedSubview(greetingLabel)

        hStack.setCustomSpacing(40, after: greetingLabel)
        hStack.addArrangedSubview(userImage)

        addSubview(hStack)
        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            hStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            hStack.trailingAnchor.constraint(equalTo: trailingAnchor),

            userImage.heightAnchor.constraint(equalToConstant: 42.h()),
            userImage.widthAnchor.constraint(equalToConstant: 42.w()),
        ])
    }
}
