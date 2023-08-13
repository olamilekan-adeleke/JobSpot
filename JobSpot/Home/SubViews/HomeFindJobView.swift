//
//  HomeFindJobView.swift
//  JobSpot
//
//  Created by Enigma Kod on 13/08/2023.
//

import SwiftUI
import UIKit

class HomeFindJobView: UIView {
    private let remoteJobContainer = HomeFindJobViewItemWidget(
        frame: CGRect.zero,
        title: "66.8k",
        subTitle: "Full Time"
    )

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .yellow.withAlphaComponent(0.5)
        style()
        layout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: bounds.width, height: 270)
    }

    private func style() {
        remoteJobContainer.frame = CGRect(x: 0, y: 0, width: 150, height: 75)
        remoteJobContainer.layer.backgroundColor = UIColor(red: 0.686, green: 0.925, blue: 0.996, alpha: 1).cgColor
        remoteJobContainer.layer.cornerRadius = 6
        addSubview(remoteJobContainer)
    }

    private func layout() {
        // Boxes
        NSLayoutConstraint.activate([
            remoteJobContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}

class HomeFindJobViewItemWidget: UIView {
    private let container = makeView()
    private let titleLabel = makeLabel(withText: "", ofSize: 16, weight: .bold)
    private let subtitleLabel = makeLabel(withText: "", ofSize: 14, weight: .light)

    init(frame: CGRect, title: String, subTitle: String) {
        super.init(frame: frame)
        titleLabel.text = title
        subtitleLabel.text = subTitle
        layout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override var intrinsicContentSize: CGSize { CGSize(width: 150, height: 75) }

    private func layout() {
        container.addSubview(titleLabel)
        container.addSubview(subtitleLabel)

        addSubview(container)

        NSLayoutConstraint.activate([
            container.widthAnchor.constraint(equalToConstant: frame.width),
            container.heightAnchor.constraint(equalToConstant: frame.height),
        ])

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 18),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subtitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
}

struct HomeFindJobViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        return HomeFindJobView()
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

struct HomeFindJobView_Preview: PreviewProvider {
    static var previews: some View {
        return HomeFindJobViewRepresentable()
    }
}
