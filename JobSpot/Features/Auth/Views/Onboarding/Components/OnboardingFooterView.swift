//
//  OnboardingFooterView.swift
//  JobSpot
//
//  Created by Enigma Kod on 29/11/2023.
//

import SwiftUI
import UIKit

class OnboardingFooterView: UIView {
    let captionLabel = Label(type: .regular)
    let summaryLabel = Label(type: .thin, str: "Explore all the most exciting job roles based \non your interest and study major.")
    let button = BaseButton(viewModel: .init(type: .primary, title: "Join Use Today"))

    private let vStack = stackView()

//    let arrowIcon = UIImageView()
//    let iconButton = UIView()

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

extension OnboardingFooterView {
    public func style() {
        translatesAutoresizingMaskIntoConstraints = false

        let firstString = NSMutableAttributedString(string: "Find Your\n", attributes: [
            .font: UIFont.systemFont(ofSize: 40, weight: .bold),
        ])
        let secondString = NSAttributedString(string: "Dream Job\n", attributes: [
            .font: UIFont.systemFont(ofSize: 40, weight: .bold),
            .foregroundColor: UIColor(red: 0.99, green: 0.64, blue: 0.3, alpha: 1),
            .underlineColor: UIColor(red: 0.99, green: 0.64, blue: 0.3, alpha: 1),
            .underlineStyle: NSUnderlineStyle.single.rawValue,
        ])
        let thirdString = NSAttributedString(string: "Here!", attributes: [
            .font: UIFont.systemFont(ofSize: 40, weight: .bold),
        ])

        firstString.append(secondString)
        firstString.append(thirdString)

        captionLabel.attributedText = firstString
        captionLabel.numberOfLines = 0
//        addSubview(captionLabel)

        summaryLabel.numberOfLines = 0
//        addSubview(summaryLabel)

//        let image = UIImage(systemName: "arrow.right")?.withTintColor(UIColor.white, renderingMode: .alwaysOriginal)
//        arrowIcon.image = image
//        arrowIcon.tintColor = UIColor.white

//        iconButton.backgroundColor = UIColor(red: 0.07, green: 0, blue: 0.38, alpha: 1).withAlphaComponent(0.9)
//        iconButton.layer.cornerRadius = 30
//        iconButton.addSubview(arrowIcon)
//        addSubview(iconButton)

        let gesture = UITapGestureRecognizer(target: self, action: #selector(onIconTapped))
//        arrowIcon.addGestureRecognizer(gesture)
//        arrowIcon.isUserInteractionEnabled = true

        button.setOnTap(gesture)
//        addSubview(button)
    }

    public func layout() {
//        summaryLabel.translatesAutoresizingMaskIntoConstraints = false
//        captionLabel.translatesAutoresizingMaskIntoConstraints = false
//        arrowIcon.translatesAutoresizingMaskIntoConstraints = false
//        iconButton.translatesAutoresizingMaskIntoConstraints = false

        vStack.addArrangedSubview(captionLabel)
        
        vStack.setCustomSpacing(10, after: captionLabel)
        vStack.addArrangedSubview(summaryLabel)

        vStack.setCustomSpacing(20, after: summaryLabel)
        vStack.addArrangedSubview(button)
        
        addSubview(vStack)

        NSLayoutConstraint.activate([
//            iconButton.widthAnchor.constraint(equalToConstant: 60),
//            iconButton.heightAnchor.constraint(equalToConstant: 60),
//            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
//            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AppSize.horizontalPadding),
//            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -AppSize.horizontalPadding),

//            arrowIcon.centerXAnchor.constraint(equalTo: iconButton.centerXAnchor),
//            arrowIcon.centerYAnchor.constraint(equalTo: iconButton.centerYAnchor),

//            summaryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AppSize.horizontalPadding),
//            summaryLabel.bottomAnchor.constraint(equalTo: iconButton.topAnchor, constant: -15),
//            summaryLabel.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -25),

//            captionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AppSize.horizontalPadding),
//            captionLabel.bottomAnchor.constraint(equalTo: summaryLabel.topAnchor, constant: -8),

            vStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            vStack.topAnchor.constraint(equalTo: topAnchor),
            vStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
        ])
    }

    @objc func onIconTapped() {
        pushToVc(vc: LoginVC())
    }
}
