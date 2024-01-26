//
//  CompanyDetailsVC.swift
//  JobSpot
//
//  Created by Enigma Kod on 16/01/2024.
//

import SwiftUI
import UIKit


// Segmented Control

class CompanyDetailsVC: UIViewController {
    private let bodyView = CompanyDetailsView()

    override func viewDidLoad() {
        style()
        layout()
    }
}

extension CompanyDetailsVC {
    private func style() {
        view.backgroundColor = .white
    }

    private func layout() {
        view.addSubview(bodyView)
        bodyView.pinToEdges(to: view)
    }
}

struct CompanyDetails_Previews: PreviewProvider {
    static var previews: some View {
        CompanyDetailsVC().showPreview()
    }
}
