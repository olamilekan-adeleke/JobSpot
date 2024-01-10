//
//  size_helper.swift
//  JobSpot
//
//  Created by Enigma Kod on 29/11/2023.
//

import UIKit

struct AppSize {
    static var shared = AppSize()
    
    private var DEVICE_WIDTH: CGFloat { UIScreen.main.bounds.width }
    private var DEVICE_HEIGHT: CGFloat { UIScreen.main.bounds.height }
    
    private var referenceWidth: CGFloat = 375 // default values
    private var referenceHeight: CGFloat = 667 // default values
    
    static var horizontalPadding: CGFloat { 16 }
    
    mutating func setup(width referenceWidth: CGFloat, height referenceHeight: CGFloat) {
        self.referenceWidth = referenceWidth
        self.referenceHeight = referenceHeight
    }
    
    /// Returns a percentage of the screen height in respect to the value given.
    func sh(_ value: Double) -> CGFloat {
        return CGFloat(value / 100) * self.DEVICE_HEIGHT
    }
    
    /// Returns a percentage of the screen width in respect to the value given.
    func sw(_ value: Double) -> CGFloat {
        return CGFloat(value / 100) * self.DEVICE_WIDTH
    }
    
    /// Calculates the scalable pixel (sp) depending on the device's screen size.
    func sp(_ value: Double) -> CGFloat {
        return CGFloat(value) * self.DEVICE_WIDTH / self.referenceWidth
    }
    
    /// Converts the value to CGFloat representing height.
    func h(_ value: Double) -> CGFloat {
        return CGFloat(value) * self.DEVICE_HEIGHT / self.referenceHeight
    }
    
    /// Converts the value to CGFloat representing width.
    func w(_ value: Double) -> CGFloat {
        return CGFloat(value) * self.DEVICE_WIDTH / self.referenceWidth
    }
}
