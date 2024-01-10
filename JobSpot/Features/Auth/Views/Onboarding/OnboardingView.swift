//
//  OnboardingView.swift
//  JobSpot
//
//  Created by Enigma Kod on 09/11/2023.
//

import SwiftUI
import UIKit

class OnBoardingView: UIView {
    let headerView = OnboardingHeaderWithImage()
    let footerView = OnboardingFooterView()

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

extension OnBoardingView {
    public func style() {
        translatesAutoresizingMaskIntoConstraints = false
        headerView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(headerView)
        addSubview(footerView)
    }

    public func layout() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: topAnchor, constant: AppSize.horizontalPadding),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AppSize.horizontalPadding),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -AppSize.horizontalPadding),
            
            footerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            footerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AppSize.horizontalPadding),
            footerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -AppSize.horizontalPadding),
        ])
    }
}
