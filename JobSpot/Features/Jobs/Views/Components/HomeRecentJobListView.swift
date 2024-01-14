//
//  HomeRecentJobListView.swift
//  JobSpot
//
//  Created by Enigma Kod on 13/01/2024.
//

import UIKit

final class HomeRecentJobListView: UIView {
    private let header = Label(type: .bold, str: "Recent Job List")
    private let jobOptionOne = JobOptionsView()
    private let jobOptionTwo = JobOptionsView()
    private let jobOptionThree = JobOptionsView()

//    private let tableListView = TableView()
//    private let tableListView = TextView()
    private let vStack = stackView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        style()
        layout()

//        vStack.backgroundColor = .yellow
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeRecentJobListView {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
//        tableListView?.translatesAutoresizingMaskIntoConstraints = false
    }

    private func layout() {
        vStack.addArrangedSubview(header)

        vStack.setCustomSpacing(15, after: header)
        vStack.addArrangedSubview(jobOptionOne)
        vStack.setCustomSpacing(10, after: jobOptionOne)
        vStack.addArrangedSubview(jobOptionTwo)
        vStack.setCustomSpacing(10, after: jobOptionTwo)
        vStack.addArrangedSubview(jobOptionThree)
        vStack.setCustomSpacing(10, after: jobOptionThree)

        addSubview(vStack)
        vStack.pinToEdges(to: self)
//        tableListView.didMove(toParent: self)
    }

    private func setUpTable() {}
}
