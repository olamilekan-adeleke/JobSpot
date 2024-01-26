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
                case .primary: return UIColor.AppColor.appPrimaryColor
                case .secondary: return UIColor(red: 0.839, green: 0.804, blue: 0.996, alpha: 1)
                case .tertiary: return UIColor.AppColor.appTertiaryColor
                case .iconButton: return UIColor.AppColor.appTertiaryLightColor
            }
        }

        var textColor: UIColor {
            switch type {
                case .primary: return UIColor.white
                case .secondary: return UIColor.black
                case .tertiary: return UIColor.white
                case .iconButton: return UIColor(red: 0.988, green: 0.276, blue: 0.276, alpha: 1)
            }
        }
    }
}
