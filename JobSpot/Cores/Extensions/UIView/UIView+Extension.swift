//
//  UIView+Extension.swift
//  JobSpot
//
//  Created by Enigma Kod on 06/01/2024.
//

import UIKit

extension UIView {
    func pushToVc(vc: UIViewController) {
        var responder: UIResponder? = self

        while let nextResponder = responder?.next {
            if let viewController = nextResponder as? UIViewController {
//                viewController.present(vc, animated: true, completion: nil)
                viewController.navigationController?.pushViewController(vc, animated: true)
                break
            }

            responder = nextResponder
        }
    }

    func pinToEdges(to other: UIView) {
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: other.leadingAnchor),
            trailingAnchor.constraint(equalTo: other.trailingAnchor),
            topAnchor.constraint(equalTo: other.topAnchor),
            bottomAnchor.constraint(equalTo: other.bottomAnchor),
        ])
    }

    func pinToEdgesWithHorizontalPadding(to other: UIView) {
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: other.leadingAnchor, constant: AppSize.horizontalPadding),
            trailingAnchor.constraint(equalTo: other.trailingAnchor, constant: -AppSize.horizontalPadding),
            topAnchor.constraint(equalTo: other.topAnchor),
            bottomAnchor.constraint(equalTo: other.bottomAnchor),
        ])
    }
}
