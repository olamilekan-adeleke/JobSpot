//
//  ViewController.swift
//  JobSpot
//
//  Created by Enigma Kod on 12/08/2023.
//

import SwiftUI
import UIKit

// 0D0140
class HomeTabViewController: UIViewController {
    let stack = makeStack(axis: .vertical, debug: false)
    let header = HomeHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
        layout()
    }

    private func setUpUI() {
        stack.addArrangedSubview(header)

        view.addSubview(stack)
    }

    private func layout() {
        // Stack
        stack.spacing = 24
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stack.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
        ])
    }
}

struct HomeTabViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        return HomeTabViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}

struct HomeTabViewController_Preview: PreviewProvider {
    static var previews: some View {
        return HomeTabViewControllerRepresentable()
    }
}
