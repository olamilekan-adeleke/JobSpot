//
//  NameViewModel.swift
//  JobSpot
//
//  Created by Enigma Kod on 10/12/2023.
//

import Combine
import Foundation

enum FormzValidationState {
    case idel
    case error(ErrorState)
    case valid

    enum ErrorState {
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
    func validate(publisher: AnyPublisher<String, Never>) -> AnyPublisher<FormzValidationState, Never>
}

final class NameViewModel {
    enum NameState: Equatable {
        case idel, error(ErrorState), success

        enum ErrorState {
            case empty, toShort, numbers, specialChars

            var description: String {
                switch self {
                    case .empty:
                        return "Field can't be empty."
                    case .toShort:
                        return "Name is to short."
                    case .numbers:
                        return "Name can't contain any numbers."
                    case .specialChars:
                        return "Name can't contain special characters."
                }
            }
        }
    }

    @Published var firstName = ""
    @Published var state: NameState = .idel

    var isEmpty: AnyPublisher<Bool, Never> {
        $firstName.map { $0.isEmpty }.eraseToAnyPublisher()
    }

    var isToShort: AnyPublisher<Bool, Never> {
        $firstName.map { ($0.count > 2) == false }.eraseToAnyPublisher()
    }

    var hasNumbers: AnyPublisher<Bool, Never> {
        $firstName.map { $0.hasNumber() }.eraseToAnyPublisher()
    }

    var hasSpecialChars: AnyPublisher<Bool, Never> {
        $firstName.map { $0.hasSpecialChars() }.eraseToAnyPublisher()
    }

    func startValidation() {
        guard state == .idel else { return }

        Publishers.CombineLatest4(isEmpty, isToShort, hasNumbers, hasNumbers).map {
            if $0.0 { return .error(.empty) }
            if $0.1 { return .error(.toShort) }
            if $0.2 { return .error(.numbers) }
            if $0.3 { return .error(.specialChars) }

            return .success
        }.assign(to: &$state)
    }
}
