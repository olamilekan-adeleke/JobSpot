//
//  HomeRecentJobListView.swift
//  JobSpot
//
//  Created by Enigma Kod on 13/01/2024.
//

import UIKit

final class HomeRecentJobListView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let header = Label(type: .bold, str: "Recent Job List")
    private let tableView: UITableView = .init()

//    private let jobOptionOne = JobOptionsView()
//    private let jobOptionTwo = JobOptionsView()
//    private let jobOptionThree = JobOptionsView()

//    private let vStack = stackView()
    
//    private let cells = []

    override func viewDidLoad() {
//        super.init(frame: )

        style()
        layout()

        tableView.delegate = self
        tableView.dataSource = self

//        tableView.isScrollEnabled = false

//        tableView.register(JobOptionsView.self, forCellReuseIdentifier: "JobOptionsViewCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "JobOptionsViewCell")
//        tableView.register(JobOptionsView.self, forCellReuseIdentifier: "JobOptionsViewCell")

//        tableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)

//        tableView.rowHeight = 44.0
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
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JobOptionsViewCell", for: indexPath) // as! JobOptionsView

        // as! JobOptionsView
//        cell.textLabel?.text = "Row \(indexPath.row)"
//        cell.configure(withText: "Row \(indexPath.row)")
        return cell
    }
}

extension HomeRecentJobListView {
    private func style() {
        tableView.separatorColor = .white
//        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
//        tableView.backgroundColor = UIColor.clear
    }

    private func layout() {
//        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        tableView.pinToEdges(to: view)
    }

    private func setUpTable() {}
}

import SwiftUI

// class CustomView: UIViewController {
////    let vStack = ScrollableStackView() // stackView()
//    let body = HomeRecentJobListView()
//
//    override func viewDidLoad() {
//        style()
//        layout()
//    }
// }
//
// extension CustomView {
//    private func style() {}
//
//    private func layout() {
//        addChild(body)
////        vStack.backgroundColor = .yellow
//
//        vStack.addSubview(body.view)
//
////        body.view.widthAnchor.constraint(equalToConstant: 100.sw() - 40).isActive = true
//        view.addSubview(vStack)
//        vStack.pinToEdges(to: view)
//
////        body.didMove(toParent: self)
//    }
// }

struct Custom_Previews: PreviewProvider {
    static var previews: some View {
        HomeRecentJobListView().showPreview()
    }
}
