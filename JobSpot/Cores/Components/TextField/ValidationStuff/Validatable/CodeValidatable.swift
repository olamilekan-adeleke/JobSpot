//
//  CodeValidatable.swift
//  JobSpot
//
//  Created by Enigma Kod on 08/01/2024.
//

import Combine
import Foundation

struct CodeValidatable: BaseFormValidatable {
    func validate(publisher: AnyPublisher<String, Never>) -> AnyPublisher<FormValidationState, Never> {
        Publishers.CombineLatest(
            isEmpty(publisher: publisher),
            isTooShort(publisher: publisher, minLen: 3)
        )
        .removeDuplicates(by: { $0 == $1 })
        .map {
            if $0.0 { return .invaild(.empty("Code")) }
            if $0.1 { return .invaild(.custom("Code is too short")) }
            
            return .valid
        }.eraseToAnyPublisher()
    }
}
