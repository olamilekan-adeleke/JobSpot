//
//  HomeBannerView.swift
//  JobSpot
//
//  Created by Enigma Kod on 10/01/2024.
//

import UIKit

class HomeBannerView: UIView {
//    private let boxView = BoxView()

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

    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
}

extension HomeBannerView {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false

//        boxView.backgroundColor = UIColor.AppColor.appColor
    }

    private func layout() {
//        boxView.pinToEdges(to: self)
//        NSLayoutConstraint.activate([
//            boxView.heightAnchor.constraint(equalToConstant: 143.h()),
//            boxView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            boxView.trailingAnchor.constraint(equalTo: trailingAnchor),
//        ])
    }
}
