//
//  TextViewCnntroller.swift
//  JobSpot
//
//  Created by Enigma Kod on 09/12/2023.
//

import Combine
import SwiftUI
import UIKit

class TextViewCnntroller: UIViewController {
    private lazy var vStack = stackView()

    lazy var nameTextField = CustomTextField(viewModel: .init(type: .name, placeHolder: "Abeg enter better name!"))
    lazy var emailTextField = CustomTextField(viewModel: .init(type: .email))
    lazy var passwordTextField = CustomTextField(viewModel: .init(type: .password))

//    private let nameViewModel = NameViewModel()
    private var subscriptions = Set<AnyCancellable>()

    override func viewDidLoad() {
        style()
        layout()
    }
}

extension TextViewCnntroller {
    private func style() {
        view.backgroundColor = .white
    }

    private func layout() {
        vStack.addArrangedSubview(nameTextField)
        vStack.addArrangedSubview(emailTextField)
        vStack.addArrangedSubview(passwordTextField)

        view.addSubview(vStack)

        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),

            vStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: AppSize.kGobalPadding),
            vStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -AppSize.kGobalPadding),
        ])
    }

    private func moveToNext() {
        let formValid = [nameTextField, emailTextField, passwordTextField].allSatisfy { $0.validationState == .valid }
        if formValid == false { return }
    }
}

struct MyTextView_Previews: PreviewProvider {
    static var previews: some View {
        TextViewCnntroller().showPreview()
    }
}
