//
//  HomeVC.swift
//  JobSpot
//
//  Created by Enigma Kod on 10/01/2024.
//

import SwiftUI
import UIKit

final class HomeVC: UIViewController {
    private let homeBody = HomeView()

    override func viewDidLoad() {
        layout()
    }
}

extension HomeVC {
    private func layout() {
        navigationItem.setHidesBackButton(true, animated: true)
        view.backgroundColor = .white
        
        view.addSubview(homeBody)
        homeBody.pinToEdges(to: view)
    }
}

struct HomeVC_Previews: PreviewProvider {
    static var previews: some View {
        HomeVC().showPreview()
    }
}
