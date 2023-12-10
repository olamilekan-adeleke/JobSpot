//
//  CustomTextField+ViewModel.swift
//  JobSpot
//
//  Created by Enigma Kod on 10/12/2023.
//

import UIKit

extension CustomTextField {
    struct ViewModel {
        var type: TextFieldTypes
        var placeHolder: String?

        init(type: TextFieldTypes, placeHolder: String? = nil) {
            self.type = type
            self.placeHolder = placeHolder ?? type.defaultPlaceHolder()
        }

        var isSecure: Bool { return type == .password ? true : false }

        var keyBoardType: UIKeyboardType {
            switch type {
                case .name, .password:
                    return .default
                case .email:
                    return .emailAddress
            }
        }

        var autoCap: UITextAutocapitalizationType {
            return type == .name ? .words : .none
        }
    }
}
