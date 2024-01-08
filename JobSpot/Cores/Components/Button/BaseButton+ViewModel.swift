//
//  BaseButton+ViewModel.swift
//  JobSpot
//
//  Created by Enigma Kod on 08/01/2024.
//

import UIKit

extension BaseButton {
    struct ViewModel {
        let type: ButtonType
        let title: String

        init(type: ButtonType, title: String) {
            self.type = type
            self.title = title
        }

        var backgroundColor: UIColor {
            switch type {
                case .primary: return UIColor(red: 0.07, green: 0, blue: 0.38, alpha: 1)
                case .secondary: return UIColor(red: 0.839, green: 0.804, blue: 0.996, alpha: 1)
            }
        }
    }
}
