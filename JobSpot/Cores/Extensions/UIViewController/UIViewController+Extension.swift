//
//  UIViewController+Extension.swift
//  JobSpot
//
//  Created by Enigma Kod on 09/12/2023.
//

import SwiftUI

extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController

        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    }

    func showPreview() -> some View {
        return Preview(viewController: self)
    }
}
