//
//  CGFloat+Extension.swift
//  JobSpot
//
//  Created by Enigma Kod on 10/01/2024.
//

import Foundation

extension CGFloat {
    /// Returns a percentage of the screen height in respect to the value given.
    func sh() -> CGFloat { AppSize.shared.sh(self) }
        
    /// Returns a percentage of the screen width in respect to the value given.
    func sw() -> CGFloat { AppSize.shared.sw(self) }
        
    /// Calculates the scalable pixel (sp) depending on the device's screen size.
    func sp() -> CGFloat { AppSize.shared.sp(self) }
        
    /// Converts the value to CGFloat representing height.
    func h() -> CGFloat { AppSize.shared.h(self) }
        
    /// Converts the value to CGFloat representing width.
    func w() -> CGFloat { AppSize.shared.w(self) }
}
