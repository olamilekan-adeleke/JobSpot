//
//  CharacterCell.swift
//  JobSpot
//
//  Created by Enigma Kod on 21/01/2024.
//

import UIKit

final class CharacterCell: UITableViewCell {
    var character: Character?

    private let hStack = stackView(axis: .horizontal)

    private let profileImage = ImageView(image: UIImage(named: "person"))

    private let vStack = stackView()
    private let title = Label(type: .regular)
    private let side = Label(type: .thin)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with character: Character) {
        self.character = character

        title.text = character.name
        side.text = character.side.rawValue

        profileImage.layer.cornerRadius = Config.imageSize / 2
        profileImage.contentMode = .scaleAspectFill
        profileImage.setContentHuggingPriority(.defaultHigh, for: .vertical)

        vStack.setContentHuggingPriority(.defaultLow, for: .vertical)
        vStack.setContentHuggingPriority(.defaultLow, for: .horizontal)
    }

    private func setUpUI() {
        vStack.addArrangedSubview(title)
        vStack.addArrangedSubview(side)

        hStack.addArrangedSubview(profileImage)
        let imageHeightCons = profileImage.heightAnchor.constraint(equalToConstant: Config.imageSize)
        imageHeightCons.priority = UILayoutPriority(999)
        NSLayoutConstraint.activate([
            imageHeightCons,
            profileImage.widthAnchor.constraint(equalToConstant: Config.imageSize),
        ])

        hStack.setCustomSpacing(10, after: profileImage)
        hStack.addArrangedSubview(vStack)

        contentView.addSubview(hStack)
        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            hStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            hStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            hStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }

    enum Config {
        static let imageSize: CGFloat = 35.h()
    }
}
