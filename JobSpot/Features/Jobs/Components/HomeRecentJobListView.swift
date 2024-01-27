//
//  HomeRecentJobListView.swift
//  JobSpot
//
//  Created by Enigma Kod on 13/01/2024.
//

import UIKit

class HomeRecentJobListView: HomeVcBaseCell {
    private let vStack = stackView()
    private let header = Label(type: .bold, str: "Recent Job List")

    private let tableView: UITableView = .init()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    private func setup() {
        style()
        layout()

        tableView.register(JobOptionsView.self, forCellReuseIdentifier: "JobOptionsViewCell")

        tableView.delegate = self
        tableView.dataSource = self
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeRecentJobListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JobOptionsViewCell", for: indexPath) as! JobOptionsView
        return cell
    }

//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200
//    }

    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        // `collectionView.contentSize` has a wrong width because in this nested example, the sizing pass occurs before the layout pass,
        // so we need to force a layout pass with the correct width.
        contentView.frame = bounds
        contentView.layoutIfNeeded()
        // Returns `collectionView.contentSize` in order to set the UITableVieweCell height a value greater than 0.
        return tableView.contentSize
    }
}

extension HomeRecentJobListView {
    private func style() {
        contentView.backgroundColor = UIColor(red: 0.975, green: 0.975, blue: 0.975, alpha: 1)

//        tableView.separatorColor = .white
//        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        tableView.backgroundColor = UIColor(red: 0.975, green: 0.975, blue: 0.975, alpha: 1)
    }

    private func layout() {
//        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = false

        vStack.addArrangedSubview(header)
        vStack.setCustomSpacing(10, after: header)
        vStack.addArrangedSubview(tableView)

        contentView.addSubview(tableView)
//        vStack.pinToEdgesWithHorizontalPadding(to: contentView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: contentView.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

//            contentView.heightAnchor.constraint(equalTo: tableView.heightAnchor),
        ])

        print("Table View Height:: \(tableView.contentSize)")
    }

    private func setUpTable() {}
}

// import SwiftUI

// struct Custom_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeRecentJobListView().showPreview()
//    }
// }
