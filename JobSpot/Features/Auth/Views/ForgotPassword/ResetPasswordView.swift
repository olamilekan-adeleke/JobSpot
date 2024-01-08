//
//  ResetPasswordVC.swift
//  JobSpot
//
//  Created by Enigma Kod on 08/01/2024.
//

import UIKit

class ResetPasswordView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)

        style()
        layout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ResetPasswordView {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        
    }

    private func layout() {}
}
