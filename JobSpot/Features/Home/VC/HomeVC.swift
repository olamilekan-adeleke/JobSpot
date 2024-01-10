//
//  HomeVC.swift
//  JobSpot
//
//  Created by Enigma Kod on 10/01/2024.
//

import UIKit
import SwiftUI

final class HomeVC: UIViewController {
    let vStack = stackView()

    override func viewDidLoad() {
        layout()
    }
}

extension HomeVC {
    private func layout() {
        //

        view.addSubview(vStack)
        vStack.pinEdges(to: view)
    }
}


