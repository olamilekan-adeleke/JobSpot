//
//  BaseTextField+ViewModel.swift
//  CustomTextField
//
//  Created by Enigma Kod on 26/12/2023.
//

import UIKit

extension BaseTextField {
    struct ViewModel {
        let type: TextFieldType
        var placeHolder: String

        init(type: TextFieldType, placeHolder: String? = nil) {
            self.type = type
            self.placeHolder = placeHolder ?? type.defaultPlaceHolder()
        }

        var isSecure: Bool { return type == .password }

        var keyboard: UIKeyboardType {
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
