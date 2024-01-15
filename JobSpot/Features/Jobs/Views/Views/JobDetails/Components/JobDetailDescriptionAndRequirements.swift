//
//  JobDetailDescriptionAndRequirements.swift
//  JobSpot
//
//  Created by Enigma Kod on 15/01/2024.
//

import UIKit

class JobDetailDescriptionAndRequirements: UIView {
    private let vStack = stackView()

    private let descriptionStack = stackView(spacing: 10)
    private let descriptionHeaderLabel = Label(type: .bold)
    private let descriptionLabel = Label(type: .regular)

    private let requirementStack = stackView(spacing: 10)
    private let requirementHeaderLabel = Label(type: .bold)
    private let requirementList = [
        "Sed ut perspiciatis unde omnis iste natus error sit.",
        "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur & adipisci velit.",
        "Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.",
        "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur",
    ]

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

extension JobDetailDescriptionAndRequirements {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false

        descriptionHeaderLabel.text = "Job Description"
        descriptionHeaderLabel.font = .systemFont(ofSize: 14, weight: .bold)

        descriptionLabel.text = """
        Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.

        At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas.

        Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain.
        """
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .justified
        descriptionLabel.font = .systemFont(ofSize: 12, weight: .regular)
        descriptionLabel.textColor = UIColor(rgb: 0x524B6B)

        requirementHeaderLabel.text = "Requirements"
        requirementHeaderLabel.font = .systemFont(ofSize: 14, weight: .bold)
    }

    private func layout() {
        vStack.addArrangedSubview(descriptionStack)
        descriptionStack.addArrangedSubview(descriptionHeaderLabel)
        descriptionStack.addArrangedSubview(descriptionLabel)

        vStack.setCustomSpacing(20, after: descriptionStack)
        vStack.addArrangedSubview(requirementStack)
        requirementStack.addArrangedSubview(requirementHeaderLabel)
        for option in requirementList {
            let optionLabel = RequirementTextView(text: option)
            requirementStack.addArrangedSubview(optionLabel)
        }

        addSubview(vStack)
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: topAnchor),
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AppSize.horizontalPadding),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -AppSize.horizontalPadding),
            vStack.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

final class RequirementTextView: UIView {
    private let hStack = stackView(axis: .horizontal)
    private let dotLabel = Label(type: .bold, str: "•")
    private let optionLabel = Label(type: .regular)

    init(text: String) {
        optionLabel.text = text
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

        hStack.alignment = .leading

        optionLabel.font = .systemFont(ofSize: 12, weight: .regular)
        optionLabel.textColor = UIColor(rgb: 0x524B6B)
        optionLabel.numberOfLines = 0
        optionLabel.textAlignment = .left
    }

    private func layout() {
        hStack.addArrangedSubview(dotLabel)
        hStack.setCustomSpacing(20, after: dotLabel)
        hStack.addArrangedSubview(optionLabel)

        addSubview(hStack)
        hStack.pinToEdges(to: self)
    }
}
