//
//  CompanyDetailAboutUsView.swift
//  JobSpot
//
//  Created by Enigma Kod on 27/01/2024.
//

import UIKit

class CompanyDetailAboutUsView: UIView {
    private let vStack = stackView()
    private let aboutText = TextOptionView()
    private let websiteText = TextOptionView()
    private let industryText = TextOptionView()
    private let employSizeText = TextOptionView()
    private let headOfficeText = TextOptionView()
    private let typeText = TextOptionView()
    private let sinceText = TextOptionView()
    private let specializationText = TextOptionView()

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
    }

    private func layout() {
        vStack.addArrangedSubview(aboutText)

        vStack.setCustomSpacing(15, after: aboutText)
        vStack.addArrangedSubview(websiteText)

        vStack.setCustomSpacing(15, after: websiteText)
        vStack.addArrangedSubview(industryText)

        vStack.setCustomSpacing(15, after: industryText)
        vStack.addArrangedSubview(employSizeText)

        vStack.setCustomSpacing(15, after: employSizeText)
        vStack.addArrangedSubview(headOfficeText)

        vStack.setCustomSpacing(15, after: headOfficeText)
        vStack.addArrangedSubview(typeText)

        vStack.setCustomSpacing(15, after: typeText)
        vStack.addArrangedSubview(sinceText)

        vStack.setCustomSpacing(15, after: sinceText)
        vStack.addArrangedSubview(specializationText)

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
