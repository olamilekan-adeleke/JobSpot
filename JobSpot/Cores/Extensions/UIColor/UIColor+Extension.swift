//
//  UIColor+Extension.swift
//  JobSpot
//
//  Created by Enigma Kod on 10/01/2024.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: a)
    }

    convenience init(rgb: Int, a: CGFloat = 1.0) {
        self.init(red: (rgb >> 16) & 0xFF, green: (rgb >> 8) & 0xFF, blue: rgb & 0xFF, a: a)
    }
}

extension UIColor {
    enum AppColor {
        static let appPrimaryColor = UIColor(rgb: 0x130160)
        static let appSecondaryColor = UIColor(rgb: 0xFF9228)
        static let appTertiaryColor = UIColor(rgb: 0xFF9228)
    }
}
