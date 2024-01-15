//
//  JobDetailsInformationView.swift
//  JobSpot
//
//  Created by Enigma Kod on 15/01/2024.
//

import UIKit

class JobDetailsInformationView: UIView {
    private let vStack = stackView()
    private let title = Label(type: .regular)

    private let positionView = InfoView(title: "Position", subtitle: "Senior Designer")
    private let qualificationView = InfoView(title: "Qualification", subtitle: "Bachelor’s Degree")
    private let experienceView = InfoView(title: "Experience", subtitle: "3 Years")
    private let jobTypeView = InfoView(title: "Job Type", subtitle: "Full Time")
    private let specializationView = InfoView(title: "Specialization", subtitle: "UI / UX Design")

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

extension JobDetailsInformationView {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false

        title.text = "Job Information"
        title.font = .systemFont(ofSize: 14, weight: .bold)
    }

    private func layout() {
        vStack.addArrangedSubview(title)

        vStack.setCustomSpacing(20, after: title)
        vStack.addArrangedSubview(positionView)

        vStack.setCustomSpacing(10, after: positionView)
        vStack.addArrangedSubview(qualificationView)

        vStack.setCustomSpacing(10, after: qualificationView)
        vStack.addArrangedSubview(experienceView)

        vStack.setCustomSpacing(10, after: experienceView)
        vStack.addArrangedSubview(jobTypeView)

        vStack.setCustomSpacing(10, after: jobTypeView)
        vStack.addArrangedSubview(specializationView)

        addSubview(vStack)
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: topAnchor),
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AppSize.horizontalPadding),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -AppSize.horizontalPadding),
            vStack.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

private final class InfoView: UIView {
    private let vStack = stackView()
    private let titleLabel = Label(type: .bold)
    private let subtitleLabel = Label(type: .thin)

    init(title: String, subtitle: String) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
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

        titleLabel.font = .systemFont(ofSize: 12, weight: .bold)
        subtitleLabel.font = .systemFont(ofSize: 12, weight: .light)
    }

    private func layout() {
        vStack.addArrangedSubview(titleLabel)
        vStack.addArrangedSubview(subtitleLabel)

        addSubview(vStack)
        vStack.pinToEdges(to: self)
    }
}
