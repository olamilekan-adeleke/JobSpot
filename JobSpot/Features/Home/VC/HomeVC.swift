//
//  HomeVC.swift
//  JobSpot
//
//  Created by Enigma Kod on 10/01/2024.
//

import SwiftUI
import UIKit

final class HomeVC: UIViewController {
    private let headerView = HomeHeaderView()
    private let homeBanner = HomeBannerView()
    private let jobStatsView = HomeJobCountStatsView()
    private let homeRecentJobListView = HomeRecentJobListView()
    private let vScrollableStack = ScrollableStackView()

    private let tableViewContainer = CustomTableViewContainerView()

//    private let homeBody = HomeView()

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

//        view.addSubview(homeBody)
//        homeBody.pinToEdges(to: view)

        vScrollableStack.add(view: headerView)

        vScrollableStack.setCustomSpacing(10, after: headerView)
        vScrollableStack.add(view: homeBanner)

        vScrollableStack.setCustomSpacing(25, after: homeBanner)
        vScrollableStack.add(view: jobStatsView)

        vScrollableStack.setCustomSpacing(25, after: jobStatsView)
        vScrollableStack.add(view: homeRecentJobListView.view)

        //        vScrollableStack.setCustomSpacing(30, after: homeRecentJobListView)
        //        vScrollableStack.add(view: tableViewContainer)

        view.addSubview(vScrollableStack)
        vScrollableStack.pinToEdgesWithHorizontalPadding(to: view)
    }
}

struct HomeVC_Previews: PreviewProvider {
    static var previews: some View {
        HomeVC().showPreview()
    }
}
