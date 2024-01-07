//
//  NameValidatable.swift
//  JobSpot
//
//  Created by Enigma Kod on 07/01/2024.
//

import Combine
import Foundation

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
