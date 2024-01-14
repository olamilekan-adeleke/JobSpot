//
//  JobOptionsView.swift
//  JobSpot
//
//  Created by Enigma Kod on 14/01/2024.
//

import UIKit

class JobOptionsView: UIView {
    private let hHeaderStack = stackView(axis: .horizontal)

    private let vTextStack = stackView(axis: .vertical)
    private let companyImageView = ImageView(image: UIImage())
    private let jobTitle = Label(type: .bold, str: "UI/UX Designer")
    private let locationTitle = Label(type: .thin, str: "Google inc - California, USA")
    private let saveIconView = ImageView(image: UIImage(systemName: "bookmark"))

    private let descriptionLabel = Label(type: .regular)

    private let hTagStack = stackView(axis: .horizontal, spacing: 10)
    private let tagOne = TagView(title: "Design")
    private let tagTwo = TagView(title: "Full time")
    private let tagThree = TagView(title: "Senior designer")

    private let hTimeAndAmountStack = stackView(axis: .horizontal)
    private let timestampLabel = Label(type: .thin)
    private let amountLabel = Label(type: .thin)

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

    private func style() {
        translatesAutoresizingMaskIntoConstraints = false

        vStack.layer.cornerRadius = 20
        vStack.backgroundColor = .white

        hHeaderStack.alignment = .center

        companyImageView.backgroundColor = .gray.withAlphaComponent(0.08)
        companyImageView.layer.cornerRadius = 38.h() / 2
//        companyImageView.layoutMargins = UIEdgeInsets(top: -7, left: -7, bottom: -7, right: -7)
//        companyImageView.image = UIImage(named: "google_icon")
//        companyImageView.layout
        companyImageView.image = UIImage(named: "google_icon")?.imageWithInsets(insetDimen: 10)
        companyImageView.contentMode = .scaleAspectFill

        jobTitle.font = .systemFont(ofSize: 13, weight: .bold)

        saveIconView.contentMode = .scaleAspectFit
        saveIconView.tintColor = .black.withAlphaComponent(0.5)

        descriptionLabel.numberOfLines = 2
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.text = "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam"
        descriptionLabel.numberOfLines = 2
        descriptionLabel.textColor = Config.lightTextColor

        timestampLabel.text = "25 minute ago"
        timestampLabel.font = .systemFont(ofSize: 10, weight: .light)
        timestampLabel.textColor = .secondaryLabel

        let firstString = NSMutableAttributedString(string: "$15K", attributes: [
            .font: UIFont.systemFont(ofSize: 12, weight: .bold),
        ])
        let secondString = NSAttributedString(string: "/Mo", attributes: [
            .font: UIFont.systemFont(ofSize: 10, weight: .regular),
            .foregroundColor: UIColor.black.withAlphaComponent(0.5),
        ])

        firstString.append(secondString)
        amountLabel.attributedText = firstString
    }

    private func layout() {
        vStack.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 16, right: 20)
        vStack.isLayoutMarginsRelativeArrangement = true

        hHeaderStack.addArrangedSubview(companyImageView)
        hHeaderStack.setCustomSpacing(10, after: companyImageView)
        NSLayoutConstraint.activate([
            companyImageView.heightAnchor.constraint(equalToConstant: 38.h()),
            companyImageView.widthAnchor.constraint(equalToConstant: 38.h()),
        ])

        vTextStack.addArrangedSubview(jobTitle)
        vTextStack.setCustomSpacing(2, after: jobTitle)
        vTextStack.addArrangedSubview(locationTitle)
        hHeaderStack.addArrangedSubview(vTextStack)

        hHeaderStack.addArrangedSubview(saveIconView)
        saveIconView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        NSLayoutConstraint.activate([
            saveIconView.heightAnchor.constraint(equalToConstant: 15.h()),
            saveIconView.widthAnchor.constraint(equalToConstant: 15.h()),
        ])

        vStack.addArrangedSubview(hHeaderStack)
        NSLayoutConstraint.activate([
            hHeaderStack.heightAnchor.constraint(equalToConstant: 40.h()),
        ])

        vStack.setCustomSpacing(10, after: hHeaderStack)
        vStack.addArrangedSubview(descriptionLabel)

        vStack.setCustomSpacing(15, after: descriptionLabel)
        hTagStack.distribution = .fillProportionally
        hTagStack.addArrangedSubview(tagOne)
        hTagStack.addArrangedSubview(tagTwo)
        hTagStack.addArrangedSubview(tagThree)
        vStack.addArrangedSubview(hTagStack)

        vStack.setCustomSpacing(20, after: hTagStack)
        hTimeAndAmountStack.addArrangedSubview(timestampLabel)
        hTimeAndAmountStack.addArrangedSubview(amountLabel)
        vStack.addArrangedSubview(hTimeAndAmountStack)

        addSubview(vStack)
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: topAnchor),
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            vStack.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

extension JobOptionsView {
    enum Config {
        static let lightTextColor = UIColor(red: 0.32, green: 0.293, blue: 0.421, alpha: 1)
    }
}

// MARK: - Tag View

private final class TagView: UIView {
    private let boxView = BoxView()
    private let title = Label(type: .thin)

    init(title: String) {
        self.title.text = title
        super.init(frame: .zero)

        style()
        layout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func style() {
        translatesAutoresizingMaskIntoConstraints = false

        boxView.backgroundColor = UIColor(rgb: 0xCBC9D4).withAlphaComponent(0.15)
        boxView.layer.cornerRadius = 8
        boxView.layoutMargins = UIEdgeInsets(top: 6, left: 21, bottom: 21, right: 6)

        title.font = .systemFont(ofSize: 12, weight: .light)
        title.textColor = .black.withAlphaComponent(0.8)
    }

    private func layout() {
        boxView.addSubview(title)

        addSubview(boxView)
        NSLayoutConstraint.activate([
            boxView.heightAnchor.constraint(equalToConstant: 26),
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.centerYAnchor.constraint(equalTo: centerYAnchor),

            boxView.widthAnchor.constraint(equalToConstant: 82),

            boxView.leadingAnchor.constraint(equalTo: leadingAnchor),
            boxView.topAnchor.constraint(equalTo: topAnchor),
            boxView.trailingAnchor.constraint(equalTo: trailingAnchor),
            boxView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
