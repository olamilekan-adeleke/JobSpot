//
//  CustomTextField+Enums.swift
//  JobSpot
//
//  Created by Enigma Kod on 10/12/2023.
//

import Foundation

extension CustomTextField {
    enum TextFieldTypes: String {
        case name, email, password

        func defaultPlaceHolder() -> String {
            return "Enter your \(self.rawValue).."
        }
    }
}
