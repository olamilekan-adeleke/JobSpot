//
//  EmailValidatable.swift
//  CustomTextField
//
//  Created by Enigma Kod on 04/01/2024.
//

import Combine
import Foundation

struct EmailValidatable: BaseFormValidatable {
    func validate(publisher: AnyPublisher<String, Never>) -> AnyPublisher<FormValidationState, Never> {
        Publishers.CombineLatest(
            isEmpty(publisher: publisher),
            isValidEmail(publisher: publisher)
        )
        .removeDuplicates(by: { $0 == $1 })
        .map {
            if $0.0 { return .invaild(.empty("Email")) }
            if $0.1 == false { return .invaild(.custom("Email is not a vaild email address")) }

            return .valid
        }.eraseToAnyPublisher()
    }

    func isValidEmail(publisher: AnyPublisher<String, Never>) -> AnyPublisher<Bool, Never> {
        publisher.map { $0.isValidEmail() }.eraseToAnyPublisher()
    }
}

struct NameValidatable: BaseFormValidatable {
    func validate(publisher: AnyPublisher<String, Never>) -> AnyPublisher<FormValidationState, Never> {
        Publishers.CombineLatest4(
            isEmpty(publisher: publisher),
            isTooShort(publisher: publisher, minLen: 2),
            hasNumber(publisher: publisher),
            hasSpecialChars(publisher: publisher)
        )
        .removeDuplicates(by: { $0 == $1 })
        .map {
            if $0.0 { return .invaild(.empty("Name")) }
            if $0.1 { return .invaild(.custom("Name is too short")) }
            if $0.2 { return .invaild(.custom("Name can not contain Numbers")) }
            if $0.3 { return .invaild(.custom("Name can not speicial chars")) }

            return .valid
        }.eraseToAnyPublisher()
    }
}

struct PasswordValidatable: BaseFormValidatable {
    func validate(publisher: AnyPublisher<String, Never>) -> AnyPublisher<FormValidationState, Never> {
        Publishers.CombineLatest4(
            isEmpty(publisher: publisher),
            isTooShort(publisher: publisher, minLen: 6),
            hasNumber(publisher: publisher),
            containLetters(publisher: publisher)
        )
        .removeDuplicates(by: { $0 == $1 })
        .map {
            if $0.0 { return .invaild(.empty("Password")) }
            if $0.1 { return .invaild(.custom("Password is too short")) }
            if $0.2 == false { return .invaild(.custom("Password must contain Numbers")) }
            if $0.3 == false { return .invaild(.custom("Password must speicial chars")) }

            return .valid
        }.eraseToAnyPublisher()
    }
}
