//
//  String+Extension.swift
//  JobSpot
//
//  Created by Enigma Kod on 10/12/2023.
//

import Foundation

extension String {
    func hasNumber() -> Bool {
        return stringFulfillsRegex(regex: ".*[0-9].*")
    }

    func hasSpecialChars() -> Bool {
        return stringFulfillsRegex(regex: ".*[^A-Za-z0-9].*")
    }

    func isValidEmail() -> Bool {
        return stringFulfillsRegex(regex: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
    }

    private func stringFulfillsRegex(regex: String) -> Bool {
        let textTest = NSPredicate(format: "SELF MATCHES %@", regex)
        guard textTest.evaluate(with: self) else {
            return false
        }
        return true
    }
}
