//
//  CompanyDetailsSegmentedControlView.swift
//  JobSpot
//
//  Created by Enigma Kod on 27/01/2024.
//

import SwiftUI
import UIKit

class CompanyDetailsSegmentedControlView: UIViewController {
    private let vStack = stackView()
    private let segmentedControl = UISegmentedControl(items: ["About Us", "Jobs"])

    private let viewBody = CompanyDetailAboutUsView()
    private let firstView = FirstViewController()

    override func viewDidLoad() {
        style()
        layout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.∑
    }
}

extension CompanyDetailsSegmentedControlView {
    private func style() {
        view.layer.backgroundColor = UIColor(red: 0.975, green: 0.975, blue: 0.975, alpha: 1).cgColor

        // Make second segment selected
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.tintColor = UIColor.AppColor.appPrimaryColor
        segmentedControl.backgroundColor = UIColor.white
        segmentedControl.selectedSegmentTintColor = UIColor(red: 0.988, green: 0.639, blue: 0.302, alpha: 1)

        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)

        segmentedControl.addTarget(self, action: #selector(segmentedValueChanged), for: .valueChanged)
    }

    private func layout() {
        vStack.addArrangedSubview(segmentedControl)
        vStack.setCustomSpacing(10, after: segmentedControl)
        NSLayoutConstraint.activate([
            segmentedControl.heightAnchor.constraint(equalToConstant: 35),
        ])

        vStack.addArrangedSubview(viewBody)

        view.addSubview(vStack)
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: view.topAnchor),
            vStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: AppSize.horizontalPadding),
            vStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -AppSize.horizontalPadding),
            vStack.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    @objc private func segmentedValueChanged(_ sender: UISegmentedControl!) {
        print("Selected Segment Index is : \(sender.selectedSegmentIndex)")

        if sender.selectedSegmentIndex == 0 {
            vStack.removeArrangedSubview(firstView)
            vStack.addArrangedSubview(viewBody)

            firstView.isHidden = true
            viewBody.isHidden = false

        } else if sender.selectedSegmentIndex == 1 {
            vStack.removeArrangedSubview(viewBody)
            vStack.addArrangedSubview(firstView)

            viewBody.isHidden = true
            firstView.isHidden = false
        }
    }
}

struct CompanyDetailsSegmentedControlView_Previews: PreviewProvider {
    static var previews: some View {
        CompanyDetailsSegmentedControlView().showPreview()
    }
}

// MARK: - Play Play

class SampleViewController: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red

        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 200),
        ])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class FirstViewController: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green

        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 600),
        ])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
