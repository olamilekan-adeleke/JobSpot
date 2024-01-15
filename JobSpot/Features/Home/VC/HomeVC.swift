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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

extension HomeVC {
    private func layout() {
        view.backgroundColor = UIColor(red: 0.975, green: 0.975, blue: 0.975, alpha: 1)

        view.addSubview(homeBody)
        homeBody.pinToEdges(to: view)
    }
}

struct HomeVC_Previews: PreviewProvider {
    static var previews: some View {
        HomeVC().showPreview()
    }
}
