//
//  BaseTextField+Enum.swift
//  CustomTextField
//
//  Created by Enigma Kod on 04/01/2024.
//

import Foundation

extension BaseTextField {
    enum TextFieldType: String {
        case name, email, password

        func defaultPlaceHolder() -> String {
            return "Enter your \(self.rawValue).."
        }
    }
}
