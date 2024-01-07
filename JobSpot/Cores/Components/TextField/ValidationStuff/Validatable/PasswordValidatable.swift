//
//  PasswordValidatable.swift
//  JobSpot
//
//  Created by Enigma Kod on 07/01/2024.
//

import Foundation
import Combine


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

