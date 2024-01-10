//
//  OnboardingHeaderWithImage.swift
//  JobSpot
//
//  Created by Enigma Kod on 09/11/2023.
//

import SwiftUI
import UIKit

class OnboardingHeaderWithImage: UIView {
    let appName = Label(type: .bold)
    let imageView = UIImageView()

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

extension OnboardingHeaderWithImage {
    public func style() {
        translatesAutoresizingMaskIntoConstraints = false

        appName.text = "JobSpot"
        appName.font = appName.font.withSize(18)
        addSubview(appName)

        imageView.image = UIImage(named: "onboarding.jpg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
    }

    public func layout() {
        // App Name
        NSLayoutConstraint.activate([
            appName.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            trailingAnchor.constraint(equalTo: appName.trailingAnchor, constant: 16),
        ])

        // Image
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: appName.bottomAnchor, constant: 80),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 32),
        ])
    }
}

struct OnboardingHeaderWithImageViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        return OnboardingHeaderWithImage()
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

struct View_Preview: PreviewProvider {
    static var previews: some View {
        return OnboardingHeaderWithImageViewRepresentable()
    }
}
