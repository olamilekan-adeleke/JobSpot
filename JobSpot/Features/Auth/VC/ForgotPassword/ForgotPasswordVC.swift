//
//  ForgotPasswordVC.swift
//  JobSpot
//
//  Created by Enigma Kod on 08/01/2024.
//

import SwiftUI
import UIKit

final class ForgotPasswordVC: UIViewController {
    private let bodyView = ForgetPasswordView()

    override func viewDidLoad() {
        layout()
    }
}

extension ForgotPasswordVC {
    private func layout() {
        view.addSubview(bodyView)
        view.backgroundColor = .white

        bodyView.pinToEdges(to: view)
    }
}

struct ForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordVC().showPreview()
    }
}
