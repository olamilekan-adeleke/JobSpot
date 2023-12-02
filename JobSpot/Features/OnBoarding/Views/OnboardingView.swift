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

    override var intrinsicContentSize: CGSize {
        return CGSize(width: DEVICE_WIDTH, height: 200)
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
            headerView.topAnchor.constraint(equalTo: topAnchor, constant: AppSize.kGobalPadding),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),

            footerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            footerView.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
}

struct ViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        return OnBoardingView()
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

struct OnBoardingViewView_Preview: PreviewProvider {
    static var previews: some View {
        return ViewRepresentable()
    }
}
