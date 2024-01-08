//
//  ResetPasswordVC.swift
//  JobSpot
//
//  Created by Enigma Kod on 08/01/2024.
//

import SwiftUI
import UIKit

class ResetPasswordVC: UIViewController {
    private let bodyView = ResetPasswordView()

    override func viewDidLoad() {
        layout()
    }
}

extension ResetPasswordVC {
    private func layout() {
        view.backgroundColor = .white

        view.addSubview(bodyView)
        bodyView.pinEdges(to: view)
    }
}

struct ResetPassword_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordVC().showPreview()
    }
}
