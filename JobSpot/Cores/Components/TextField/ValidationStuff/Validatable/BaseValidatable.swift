//
//  BaseValidatable.swift
//  CustomTextField
//
//  Created by Enigma Kod on 04/01/2024.
//

import Combine
import Foundation

protocol BaseFormValidatable {
    func validate(publisher: AnyPublisher<String, Never>) -> AnyPublisher<FormValidationState, Never>
}

extension BaseFormValidatable {
    func isEmpty(publisher: AnyPublisher<String, Never>) -> AnyPublisher<Bool, Never> {
        publisher.map { $0.isEmpty }.eraseToAnyPublisher()
    }

    func isTooShort(publisher: AnyPublisher<String, Never>, minLen: Int) -> AnyPublisher<Bool, Never> {
        publisher.map { $0.count <= minLen }.eraseToAnyPublisher()
    }

    func hasNumber(publisher: AnyPublisher<String, Never>) -> AnyPublisher<Bool, Never> {
        publisher.map { $0.hasNumber() }.eraseToAnyPublisher()
    }

    func hasSpecialChars(publisher: AnyPublisher<String, Never>) -> AnyPublisher<Bool, Never> {
        publisher.map { $0.hasSpecialChars() }.eraseToAnyPublisher()
    }

    func containLetters(publisher: AnyPublisher<String, Never>) -> AnyPublisher<Bool, Never> {
        publisher.map { $0.contains(where: { $0.isLetter }) }.eraseToAnyPublisher()
    }
}

// MARK: - Factory

enum FormValidatableFatory {
    static func validatableForType(type: BaseTextField.TextFieldType) -> BaseFormValidatable {
        switch type {
            case .name:
                return NameValidatable()
            case .email:
                return EmailValidatable()
            case .password:
                return PasswordValidatable()
        }
    }
}
