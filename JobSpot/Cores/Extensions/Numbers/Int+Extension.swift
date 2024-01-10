//
//  Int+Extension.swift
//  JobSpot
//
//  Created by Enigma Kod on 10/01/2024.
//

import Foundation

extension Int {
    /// Returns a percentage of the screen height in respect to the value given.
    func sh() -> CGFloat { AppSize.shared.sh(Double(self)) }

    /// Returns a percentage of the screen width in respect to the value given.
    func sw() -> CGFloat { AppSize.shared.sw(Double(self)) }

    /// Calculates the scalable pixel (sp) depending on the device's screen size.
    func sp() -> CGFloat { AppSize.shared.sp(Double(self)) }

    /// Converts the value to CGFloat representing height.
    func h() -> CGFloat { AppSize.shared.h(Double(self)) }

    /// Converts the value to CGFloat representing width.
    func w() -> CGFloat { AppSize.shared.w(Double(self)) }
}
