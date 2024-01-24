//
//  HomeBannerView.swift
//  JobSpot
//
//  Created by Enigma Kod on 10/01/2024.
//

import UIKit

class HomeBannerView: HomeVcBaseCell {
    override class var id: String { return "HomeVcBaseCell" }

    private let boxView = BoxView()

    private let messageLabel = Label(type: .thin, str: "50% off \ntake any courses")
    private let joinButton = BoxView() // BaseButton(viewModel: .init(type: .tertiary, title: "Join Now"))
    private let joinNowLabel = Label(type: .thin)
    private let vStack = stackView(axis: .vertical)

    private let _imageView = ImageView(image: UIImage(named: "banner_lady"))

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupStyle()
        layout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeBannerView {
    private func setupStyle() {
        translatesAutoresizingMaskIntoConstraints = false

        boxView.translatesAutoresizingMaskIntoConstraints = false
        boxView.backgroundColor = UIColor.AppColor.appPrimaryColor
        boxView.layer.cornerRadius = 6

        joinButton.backgroundColor = UIColor.AppColor.appTertiaryColor
        joinButton.layer.cornerRadius = 6

        joinNowLabel.text = "Join Now"
        joinNowLabel.font = .systemFont(ofSize: 14, weight: .regular)
        joinNowLabel.textColor = .white

        messageLabel.textColor = UIColor.white
        messageLabel.numberOfLines = 2
        messageLabel.font = .systemFont(ofSize: 18, weight: .regular)

        _imageView.contentMode = .scaleAspectFit
    }

    private func layout() {
        vStack.alignment = .leading

        vStack.addArrangedSubview(messageLabel)

        vStack.setCustomSpacing(18, after: messageLabel)
        joinButton.addSubview(joinNowLabel)
        NSLayoutConstraint.activate([
            joinNowLabel.centerXAnchor.constraint(equalTo: joinButton.centerXAnchor),
            joinNowLabel.centerYAnchor.constraint(equalTo: joinButton.centerYAnchor),
        ])
        vStack.addArrangedSubview(joinButton)

        boxView.addSubview(vStack)

        contentView.addSubview(boxView)
        contentView.addSubview(_imageView)
        NSLayoutConstraint.activate([
            boxView.heightAnchor.constraint(equalToConstant: 115.h()),
            boxView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            boxView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            contentView.heightAnchor.constraint(equalTo: boxView.heightAnchor, constant: 30),
        ])

        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: boxView.topAnchor, constant: 24),
            vStack.leadingAnchor.constraint(equalTo: boxView.leadingAnchor, constant: 16),

            joinButton.widthAnchor.constraint(equalToConstant: 90),
            joinButton.heightAnchor.constraint(equalToConstant: 27),

            _imageView.trailingAnchor.constraint(equalTo: boxView.trailingAnchor),
            _imageView.bottomAnchor.constraint(equalTo: boxView.bottomAnchor),
            _imageView.heightAnchor.constraint(equalToConstant: 173),
            _imageView.widthAnchor.constraint(equalToConstant: 156),
        ])
    }
}
