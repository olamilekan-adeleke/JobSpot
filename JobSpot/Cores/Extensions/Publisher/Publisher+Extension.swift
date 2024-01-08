//
//  Publisher+Extension.swift
//  JobSpot
//
//  Created by Enigma Kod on 06/01/2024.
//

import Combine
import Foundation

extension Publisher where Self.Output == String, Self.Failure == Never {
    func validateText(validator: BaseFormValidatable) -> AnyPublisher<FormValidationState, Never> {
        return validator.validate(publisher: self.eraseToAnyPublisher())
    }
}
