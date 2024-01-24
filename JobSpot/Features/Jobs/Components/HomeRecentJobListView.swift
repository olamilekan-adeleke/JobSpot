//
//  HomeRecentJobListView.swift
//  JobSpot
//
//  Created by Enigma Kod on 13/01/2024.
//

import UIKit

final class HomeRecentJobListView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let vStack = stackView()
    private let header = Label(type: .bold, str: "Recent Job List")

    private let tableView: UITableView = .init()

//    private let jobOptionOne = JobOptionsView()
//    private let jobOptionTwo = JobOptionsView()
//    private let jobOptionThree = JobOptionsView()

//    private let cells = []

    override func viewDidLoad() {
        style()
        layout()

//        tableView.isScrollEnabled = false

//        tableView.register(JobOptionsView.self, forCellReuseIdentifier: "JobOptionsViewCell")
        tableView.register(JobOptionsView.self, forCellReuseIdentifier: "JobOptionsViewCell")
//        tableView.register(JobOptionsView.self, forCellReuseIdentifier: "JobOptionsViewCell")

//        tableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)

//        tableView.rowHeight = 44.0

        tableView.delegate = self
        tableView.dataSource = self
    }

//    @available(*, unavailable)
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

//    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
//        if keyPath == "contentSize" {
//            print("Height:: \(tableView.contentSize.height)")
    ////            tableView.heightAnchor.constraint(equalToConstant: tableView.contentSize.height).isActive = true
//        }
//    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JobOptionsViewCell", for: indexPath) as! JobOptionsView
        return cell
    }
}

extension HomeRecentJobListView {
    private func style() {
        view.backgroundColor = UIColor(red: 0.975, green: 0.975, blue: 0.975, alpha: 1)

//        tableView.separatorColor = .white
//        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        tableView.backgroundColor = UIColor(red: 0.975, green: 0.975, blue: 0.975, alpha: 1)
    }

    private func layout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false

        vStack.addSubview(header)
        vStack.setCustomSpacing(20, after: header)
        vStack.addArrangedSubview(tableView)

        view.addSubview(vStack)
        vStack.pinToEdgesWithHorizontalPadding(to: view)
    }

    private func setUpTable() {}
}

import SwiftUI

struct Custom_Previews: PreviewProvider {
    static var previews: some View {
        HomeRecentJobListView().showPreview()
    }
}
