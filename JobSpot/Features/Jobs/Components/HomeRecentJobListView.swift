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
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    // There is just one row in every section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }

    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JobOptionsViewCell", for: indexPath) as! JobOptionsView
        return cell
    }

    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        // `collectionView.contentSize` has a wrong width because in this nested example, the sizing pass occurs before the layout pass,
        // so we need to force a layout pass with the correct width.
        contentView.frame = bounds
        contentView.layoutIfNeeded()
        // Returns `collectionView.contentSize` in order to set the UITableVieweCell height a value greater than 0.
        return tableView.contentSize
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension HomeRecentJobListView {
    private func style() {
        contentView.backgroundColor = UIColor(red: 0.975, green: 0.975, blue: 0.975, alpha: 1)
        vStack.backgroundColor = UIColor(red: 0.975, green: 0.975, blue: 0.975, alpha: 1)

        tableView.backgroundColor = UIColor(red: 0.975, green: 0.975, blue: 0.975, alpha: 1)
        tableView.separatorColor = .clear
        
        tableView.sectionHeaderTopPadding = 0
    }

    private func layout() {
        tableView.isScrollEnabled = false

        let box = BoxView()
        box.heightAnchor.constraint(equalToConstant: 20).isActive = true
        vStack.addArrangedSubview(box)
        vStack.addArrangedSubview(header)
        vStack.addArrangedSubview(tableView)

        contentView.addSubview(vStack)
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            vStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            vStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }

    private func setUpTable() {}
}
