//
//  HomeRecentJobListView.swift
//  JobSpot
//
//  Created by Enigma Kod on 13/01/2024.
//

import UIKit

final class HomeRecentJobListView: UIView, UITableViewDelegate, UITableViewDataSource {
    private let header = Label(type: .bold, str: "Recent Job List")
    private let tableView: UITableView = .init()

//    private let jobOptionOne = JobOptionsView()
//    private let jobOptionTwo = JobOptionsView()
//    private let jobOptionThree = JobOptionsView()

    private let vStack = stackView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        style()
        layout()

        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
        tableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentSize" {
            tableView.heightAnchor.constraint(equalToConstant: tableView.contentSize.height).isActive = true
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        cell.textLabel?.text = "Row \(indexPath.row)"
        cell.configure(withText: "Row \(indexPath.row)")
        return cell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0 // Adjust this value to set the desired spacing between cells
    }
}

extension HomeRecentJobListView {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = false
        tableView.separatorColor = .white
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
//        tableView.backgroundColor = UIColor.clear
    }

    private func layout() {
        vStack.addArrangedSubview(header)

        vStack.setCustomSpacing(15, after: header)
        vStack.addArrangedSubview(tableView)

//        vStack.setCustomSpacing(15, after: header)
//        vStack.addArrangedSubview(jobOptionOne)
//        vStack.setCustomSpacing(10, after: jobOptionOne)
//        vStack.addArrangedSubview(jobOptionTwo)
//        vStack.setCustomSpacing(10, after: jobOptionTwo)
//        vStack.addArrangedSubview(jobOptionThree)
//        vStack.setCustomSpacing(10, after: jobOptionThree)

        addSubview(vStack)
        vStack.pinToEdges(to: self)
    }

    private func setUpTable() {}
}
