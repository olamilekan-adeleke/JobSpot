//
//  NameViewModel.swift
//  JobSpot
//
//  Created by Enigma Kod on 10/12/2023.
//

import Combine
import Foundation

enum FormzValidationState: Equatable {
    case idel
    case error(ErrorState)
    case valid

    enum ErrorState: Equatable {
        case empty(String?)
        case inValidEmail
        case toShort(String)
        case custom(String)

        var description: String {
            switch self { case .empty(let title):
                    return "\(title ?? "Field") is empty"
                case .inValidEmail:
                    return "Invalid email address"
                case .toShort(let title):
                    return "\(title) is to short"
                case .custom(let text):
                    return text
            }
        }
    }
}

protocol FormzValidator {
    func validateText(
        validatorType: ValidatorType,
        publisher: AnyPublisher<String, Never>
    ) -> AnyPublisher<FormzValidationState, Never>
}

extension FormzValidator {
    func validateText(
        validatorType: ValidatorType,
        publisher: AnyPublisher<String, Never>
    ) -> AnyPublisher<FormzValidationState, Never> {
        let formzValidator = ValidatorFacory.validatorForType(type: validatorType)
        return formzValidator.validate(publisher: publisher)
    }
}

extension Publisher where Self.Output == String, Failure == Never {
    func validateText(validatorType: ValidatorType) -> AnyPublisher<FormzValidationState, Never> {
        let formzValidator = ValidatorFacory.validatorForType(type: validatorType)
        return formzValidator.validate(publisher: self.eraseToAnyPublisher())
    }
}

enum ValidatorType: String { case email, password, name }

enum ValidatorFacory {
    static func validatorForType(type: ValidatorType) -> FormzValidatable {
        switch type {
            case .email:
                return EmailValidator()
            case .password:
                return PasswordValidator()
            case .name:
                return NameValidator()
        }
    }
}

protocol FormzValidatable {
    func validate(publisher: AnyPublisher<String, Never>) -> AnyPublisher<FormzValidationState, Never>
}

extension FormzValidatable {
    func isEmpty(publisher: AnyPublisher<String, Never>) -> AnyPublisher<Bool, Never> {
        publisher.map { $0.isEmpty }.eraseToAnyPublisher()
    }

    func isToShort(publisher: AnyPublisher<String, Never>, length: Int) -> AnyPublisher<Bool, Never> {
        publisher.map { ($0.count >= length) == false }.eraseToAnyPublisher()
    }

    func hasNumbers(publisher: AnyPublisher<String, Never>) -> AnyPublisher<Bool, Never> {
        publisher.map { $0.hasNumber() }.eraseToAnyPublisher()
    }

    func hasSpecialChars(publisher: AnyPublisher<String, Never>) -> AnyPublisher<Bool, Never> {
        publisher.map { $0.hasSpecialChars() }.eraseToAnyPublisher()
    }

    func isVaidEmail(publisher: AnyPublisher<String, Never>) -> AnyPublisher<Bool, Never> {
        publisher.map { $0.isValidEmail() }.eraseToAnyPublisher()
    }

    func hasLetters(publisher: AnyPublisher<String, Never>) -> AnyPublisher<Bool, Never> {
        publisher.map { $0.contains(where: { $0.isLetter }) }.eraseToAnyPublisher()
    }
}

struct NameValidator: FormzValidatable {
    func validate(publisher: AnyPublisher<String, Never>) -> AnyPublisher<FormzValidationState, Never> {
        Publishers.CombineLatest4(
            isEmpty(publisher: publisher),
            isToShort(publisher: publisher, length: 2),
            hasNumbers(publisher: publisher),
            hasNumbers(publisher: publisher)
        )
        .removeDuplicates(by: { $0 == $1 })
        .map {
            if $0.0 { return .error(.empty("name")) }
            if $0.1 { return .error(.toShort("Name")) }
            if $0.2 { return .error(.custom("Name can not contain Numbers")) }
            if $0.3 { return .error(.custom("Name can not speicial chars")) }

            return .valid
        }.eraseToAnyPublisher()
    }
}

struct EmailValidator: FormzValidatable {
    func validate(publisher: AnyPublisher<String, Never>) -> AnyPublisher<FormzValidationState, Never> {
        Publishers.CombineLatest(
            isEmpty(publisher: publisher),
            isVaidEmail(publisher: publisher)
        )
        .removeDuplicates(by: { $0 == $1 })
        .map {
            if $0.0 { return .error(.empty("Email")) }
            if $0.1 == false { return .error(.toShort("Email")) }

            return .valid
        }.eraseToAnyPublisher()
    }
}

struct PasswordValidator: FormzValidatable {
    func validate(publisher: AnyPublisher<String, Never>) -> AnyPublisher<FormzValidationState, Never> {
        Publishers.CombineLatest4(
            isEmpty(publisher: publisher),
            isToShort(publisher: publisher, length: 6),
            hasNumbers(publisher: publisher),
            hasLetters(publisher: publisher)
        )
        .removeDuplicates(by: { $0 == $1 })
        .map {
            if $0.0 { return .error(.empty("Password")) }
            if $0.1 { return .error(.toShort("Password")) }
            if $0.2 == false { return .error(.custom("Password must contain Numbers")) }
            if $0.3 == false { return .error(.custom("Password must speicial chars")) }

            return .valid
        }.eraseToAnyPublisher()
    }
}

// final class NameViewModel {
//    enum NameState: Equatable {
//        case idel, error(ErrorState), success
//
//        enum ErrorState {
//            case empty, toShort, numbers, specialChars
//
//            var description: String {
//                switch self {
//                    case .empty:
//                        return "Field can't be empty."
//                    case .toShort:
//                        return "Name is to short."
//                    case .numbers:
//                        return "Name can't contain any numbers."
//                    case .specialChars:
//                        return "Name can't contain special characters."
//                }
//            }
//        }
//    }
//
//    @Published var firstName = ""
//    @Published var state: NameState = .idel
//
//    var isEmpty: AnyPublisher<Bool, Never> {
//        $firstName.map { $0.isEmpty }.eraseToAnyPublisher()
//    }
//
//    var isToShort: AnyPublisher<Bool, Never> {
//        $firstName.map { ($0.count > 2) == false }.eraseToAnyPublisher()
//    }
//
//    var hasNumbers: AnyPublisher<Bool, Never> {
//        $firstName.map { $0.hasNumber() }.eraseToAnyPublisher()
//    }
//
//    var hasSpecialChars: AnyPublisher<Bool, Never> {
//        $firstName.map { $0.hasSpecialChars() }.eraseToAnyPublisher()
//    }
//
//    func startValidation() {
//        guard state == .idel else { return }
//
//        Publishers.CombineLatest4(isEmpty, isToShort, hasNumbers, hasNumbers).map {
//            if $0.0 { return .error(.empty) }
//            if $0.1 { return .error(.toShort) }
//            if $0.2 { return .error(.numbers) }
//            if $0.3 { return .error(.specialChars) }
//
//            return .success
//        }.assign(to: &$state)
//    }
// }
