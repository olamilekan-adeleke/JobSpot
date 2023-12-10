//
//  String+Extension.swift
//  JobSpot
//
//  Created by Enigma Kod on 10/12/2023.
//

import Foundation

extension String {
    func hasNumber() -> Bool {
        let numberRegex = ".*[0-9]+.*"
        let numberPredicate = NSPredicate(format: "SELF MATCHES %@", numberRegex)
        return numberPredicate.evaluate(with: self)
    }

    func hasSpecialChars() -> Bool {
        let specialCharsRegex = ".*[^A-Za-z0-9].*"
        let specialCharsPredicate = NSPredicate(format: "SELF MATCHES %@", specialCharsRegex)
        return specialCharsPredicate.evaluate(with: self)
    }
}
