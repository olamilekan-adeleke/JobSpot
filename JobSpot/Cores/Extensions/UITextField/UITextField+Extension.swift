//
//  UITextField+Extension.swift
//  JobSpot
//
//  Created by Enigma Kod on 10/12/2023.
//

import Combine
import UIKit

extension UITextField {
    func textFieldTextPublisher() -> AnyPublisher<String, Never> {
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap { ($0.object as? UITextField)?.text }
            .eraseToAnyPublisher()
    }
}
