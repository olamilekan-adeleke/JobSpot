//
//  LoginVC.swift
//  JobSpot
//
//  Created by Enigma Kod on 06/01/2024.
//

import SwiftUI

import UIKit

class LoginVC: UIViewController {
    private let loginView = LoginView()

    override func viewDidLoad() {
        layout()
    }
}

extension LoginVC {
    public func layout() {
        view.addSubview(loginView)

        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: view.topAnchor),
            loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        LoginVC().showPreview()
    }
}
