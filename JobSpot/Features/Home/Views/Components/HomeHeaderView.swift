//
//  HomeHeaderView.swift
//  JobSpot
//
//  Created by Enigma Kod on 10/01/2024.
//

import UIKit

class HomeHeaderView: HomeVcBaseCell {
    private let greetingLabel = Label(type: .bold, str: "Hello \nKod Enigma")
    private let userImage = ImageView(image: UIImage())
    private let hStack = stackView(axis: .horizontal)

    override class var id: String { return "HomeHeaderViewCell" }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupStyle()
        layout()
    }

//    override init(frame: CGRect) { super.init(frame: frame) }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeHeaderView {
    private func setupStyle() {
//        translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = UIColor.clear
        backgroundColor = .clear

        hStack.alignment = .center

        greetingLabel.font = .systemFont(ofSize: 22, weight: .bold)
        greetingLabel.textAlignment = .left
        greetingLabel.numberOfLines = 0

        userImage.backgroundColor = .yellow
        userImage.layer.cornerRadius = 40.h() / 2
        userImage.image = UIImage(named: "person")
        userImage.clipsToBounds = true
        userImage.contentMode = .scaleAspectFill
    }

    private func layout() {
        hStack.addArrangedSubview(greetingLabel)

        hStack.setCustomSpacing(40, after: greetingLabel)
        hStack.addArrangedSubview(userImage)

        contentView.addSubview(hStack)
        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            hStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            hStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            hStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            userImage.heightAnchor.constraint(equalToConstant: 40.h()),
            userImage.widthAnchor.constraint(equalToConstant: 40.h()),
        ])
    }
}
