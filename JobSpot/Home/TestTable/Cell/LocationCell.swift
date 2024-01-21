//
//  LocationCell.swift
//  JobSpot
//
//  Created by Enigma Kod on 21/01/2024.
//

import UIKit

final class LocationCell: UITableViewCell {
    var location: KLocation?

    private let hStack = stackView(axis: .horizontal)

    private let locationImage = BoxView()
    private let vStack = stackView()
    private let title = Label(type: .regular)
    private let des = Label(type: .thin)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with location: KLocation) {
        self.location = location

        locationImage.backgroundColor = .gray.withAlphaComponent(0.2)
        locationImage.layer.cornerRadius = 8

        title.text = location.name
        title.font = .systemFont(ofSize: 14, weight: .bold)

        des.text = location.description.trimmingCharacters(in: .whitespacesAndNewlines)
        des.font = .systemFont(ofSize: 12, weight: .light)
        des.textColor = .lightGray
        des.numberOfLines = 5
        des.textAlignment = .left
    }

    private func setupUI() {
        vStack.addArrangedSubview(title)
        vStack.setCustomSpacing(5, after: title)
        vStack.addArrangedSubview(des)
        hStack.addArrangedSubview(vStack)

        hStack.setCustomSpacing(15, after: vStack)
        hStack.addArrangedSubview(locationImage)
        let imageHeightCons = locationImage.heightAnchor.constraint(equalToConstant: 80.h())
        imageHeightCons.priority = UILayoutPriority(999)
        NSLayoutConstraint.activate([
            imageHeightCons,
            locationImage.widthAnchor.constraint(equalToConstant: 60.w()),
        ])

        contentView.addSubview(hStack)
        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            hStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            hStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            hStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
}
