//
//  CompanyDetailAboutUsView.swift
//  JobSpot
//
//  Created by Enigma Kod on 27/01/2024.
//

import UIKit

class CompanyDetailAboutUsView: UIView {
    private let vStack = stackView(spacing: 15)
    private let aboutText = TextOptionView()
    private let websiteText = TextOptionView()
    private let industryText = TextOptionView()
    private let employSizeText = TextOptionView()
    private let headOfficeText = TextOptionView()
    private let typeText = TextOptionView()
    private let sinceText = TextOptionView()
    private let specializationText = TextOptionView()
    private let companyGallery = TextOptionView()

    private let companyImageView = CompanyImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        style()
        layout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let aboutUsText: String = "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. \n\nAt vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas."
}

extension CompanyDetailAboutUsView {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false

        aboutText.configure(title: "About Us", subtitle: aboutUsText)
        websiteText.configure(title: "Website", subtitle: "https://www.google.com")
        industryText.configure(title: "Industry", subtitle: "Internet product")
        employSizeText.configure(title: "Employee size", subtitle: "132,121 Employees")
        headOfficeText.configure(title: "Head office", subtitle: "Mountain View, California, Amerika Serikat")
        typeText.configure(title: "Type", subtitle: "Multinational company")
        sinceText.configure(title: "Since", subtitle: "1998")
        specializationText.configure(title: "Specialization", subtitle: "Search technology, Web computing, Software and Online advertising")
        companyGallery.configure(title: "Comapny Gallery", subtitle: "")

        companyImageView.configure(images: ["company_image_one", "company_image_two", "company_image_two", "company_image_two"])
    }

    private func layout() {
        vStack.addArrangedSubview(BoxView())
        vStack.addArrangedSubview(aboutText)
        vStack.addArrangedSubview(websiteText)
        vStack.addArrangedSubview(industryText)
        vStack.addArrangedSubview(employSizeText)
        vStack.addArrangedSubview(headOfficeText)
        vStack.addArrangedSubview(typeText)
        vStack.addArrangedSubview(sinceText)
        vStack.addArrangedSubview(specializationText)
        vStack.addArrangedSubview(companyGallery)

        vStack.addArrangedSubview(companyImageView)

        addSubview(vStack)
        vStack.pinToEdges(to: self)
    }
}

// MARK: - Text Options View

private class TextOptionView: UIView {
    private let vStack = stackView()
    private let title = Label(type: .bold)
    private let subtitle = Label(type: .regular)

    override init(frame: CGRect) {
        super.init(frame: .zero)

        style()
        layout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open func configure(title: String, subtitle: String) {
        self.title.text = title
        self.subtitle.text = subtitle
    }

    private func style() {
        translatesAutoresizingMaskIntoConstraints = false

        title.font = .systemFont(ofSize: 14, weight: .bold)

        subtitle.font = .systemFont(ofSize: 12, weight: .regular)
        subtitle.numberOfLines = 0
        subtitle.textColor = UIColor(red: 0.32, green: 0.293, blue: 0.421, alpha: 1)
    }

    private func layout() {
        vStack.addArrangedSubview(title)
        vStack.setCustomSpacing(5, after: title)
        vStack.addArrangedSubview(subtitle)

        addSubview(vStack)
        vStack.pinToEdges(to: self)
    }
}

// MARK: - Company Image

private class CompanyImageView: UIView {
    private let hStack = stackView(axis: .horizontal)
    private var images = [String]()

    private let boxView = BoxView()
    private let moreText = Label(type: .regular)

    override init(frame: CGRect) {
        super.init(frame: .zero)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open func configure(images: [String]) {
        self.images = images

        layout()
        style()
    }

    private func style() {
        translatesAutoresizingMaskIntoConstraints = false

        boxView.frame = CGRect(x: 0, y: 0, width: Config.width, height: Config.height)
        boxView.alpha = 0.7
        boxView.backgroundColor = UIColor(red: 0.048, green: 0.21, blue: 0.283, alpha: 1)
        boxView.layer.cornerRadius = 8

        moreText.text = "+\(images.count) pictures"
        moreText.font = .systemFont(ofSize: 12, weight: .bold)
        moreText.textColor = UIColor.white
    }

    private func layout() {
        hStack.distribution = .equalSpacing
        hStack.alignment = .fill

        let imageOne = ImageView(image: UIImage(named: images[0]))
        imageOne.frame = CGRect(x: 0, y: 0, width: Config.width, height: Config.height)
        let imageTwo = ImageView(image: UIImage(named: images[1]))

        imageOne.contentMode = .scaleAspectFill
        imageTwo.contentMode = .scaleAspectFill

        imageOne.layer.cornerRadius = 8
        imageOne.clipsToBounds = true
        imageTwo.layer.cornerRadius = 8
        imageTwo.clipsToBounds = true

        hStack.addArrangedSubview(imageOne)
        hStack.addArrangedSubview(imageTwo)
        NSLayoutConstraint.activate([
            imageOne.heightAnchor.constraint(equalToConstant: Config.height),
            imageOne.widthAnchor.constraint(equalToConstant: Config.width),

            imageTwo.heightAnchor.constraint(equalToConstant: Config.height),
            imageTwo.widthAnchor.constraint(equalToConstant: Config.width),
        ])

        imageTwo.addSubview(boxView)
        boxView.pinToEdges(to: imageTwo)

        imageTwo.addSubview(moreText)
        NSLayoutConstraint.activate([
            moreText.centerXAnchor.constraint(equalTo: imageTwo.centerXAnchor),
            moreText.centerYAnchor.constraint(equalTo: imageTwo.centerYAnchor),
        ])

        addSubview(hStack)
        hStack.pinToEdges(to: self)
    }

    enum Config {
        static let height = 100.h()
        static let width = 44.sw()
    }
}
