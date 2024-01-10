//
//  UIColor+Extension.swift
//  JobSpot
//
//  Created by Enigma Kod on 10/01/2024.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(netHex: Int) {
        self.init(red: (netHex >> 16) & 0xff, green: (netHex >> 8) & 0xff, blue: netHex & 0xff)
    }

    enum AppColor {
        static let appPrimaryColor = UIColor(netHex: 0x130160)
        static let appSecondaryColor = UIColor(netHex: 0xFF9228)
        static let appTertiaryColor = UIColor(netHex: 0xFF9228)
    }
}
