//
//  HomeView.swift
//  JobSpot
//
//  Created by Enigma Kod on 10/01/2024.
//

import UIKit

final class HomeView: UIView {
    private let headerView = HomeHeaderView()
    private let vScrollableStack = ScrollableStackView()

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
    }

    private func layout() {
        vScrollableStack.add(view: headerView)

        addSubview(vScrollableStack)
        vScrollableStack.pinToEdgesWithHorizontalPadding(to: self)
    }
}
