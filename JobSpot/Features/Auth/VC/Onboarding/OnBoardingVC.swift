//
//  OnBoardingVC.swift
//  JobSpot
//
//  Created by Enigma Kod on 09/11/2023.
//

import SwiftUI
import UIKit

class OnBoardingVC: UIViewController {
    let viewBody = OnBoardingView()

    override func viewDidLoad() {
        super.viewDidLoad()

        style()
        layout()
    }
}

extension OnBoardingVC {
    public func style() {
        view.addSubview(viewBody)
    }

    public func layout() {
        viewBody.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            viewBody.topAnchor.constraint(equalTo: view.topAnchor),
            viewBody.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            viewBody.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewBody.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

struct OnBoardingVCView_Preview: PreviewProvider {
    static var previews: some View {
        return OnBoardingVC().showPreview()
    }
}
