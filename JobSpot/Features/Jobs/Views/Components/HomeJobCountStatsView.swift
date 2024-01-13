//
//  HomeJobCountStatsView.swift
//  JobSpot
//
//  Created by Enigma Kod on 13/01/2024.
//

import UIKit

class HomeJobCountStatsView: UIView {
    private let header = Label(type: .bold, str: "Find Your Job")

    private let vStack = stackView()

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

extension HomeJobCountStatsView {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    private func layout() {}
}
