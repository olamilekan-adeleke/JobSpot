//
//  HomeView.swift
//  JobSpot
//
//  Created by Enigma Kod on 10/01/2024.
//

import UIKit

final class HomeView: UIView {
    private let headerView = HomeHeaderView()
    private let homeBanner = HomeBannerView()
    private let jobStatsView = HomeJobCountStatsView()
    private let homeRecentJobListView = HomeRecentJobListView()
    private let vScrollableStack = ScrollableStackView()

    private let tableViewContainer = CustomTableViewContainerView()

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

extension HomeView {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false

        vScrollableStack.showsVerticalScrollIndicator = false
    }

    private func layout() {
        vScrollableStack.add(view: headerView)

        vScrollableStack.setCustomSpacing(10, after: headerView)
        vScrollableStack.add(view: homeBanner)

        vScrollableStack.setCustomSpacing(25, after: homeBanner)
        vScrollableStack.add(view: jobStatsView)

        vScrollableStack.setCustomSpacing(25, after: jobStatsView)
        vScrollableStack.add(view: homeRecentJobListView.view)

//        vScrollableStack.setCustomSpacing(30, after: homeRecentJobListView)
//        vScrollableStack.add(view: tableViewContainer)

        addSubview(vScrollableStack)
        vScrollableStack.pinToEdgesWithHorizontalPadding(to: self)
    }
}
