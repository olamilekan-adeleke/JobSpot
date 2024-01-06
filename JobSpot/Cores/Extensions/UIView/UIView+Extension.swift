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
                // viewController.present(loginVc, animated: true, completion: nil)
                viewController.navigationController?.pushViewController(vc, animated: true)
                break
            }

            responder = nextResponder
        }
    }
}
