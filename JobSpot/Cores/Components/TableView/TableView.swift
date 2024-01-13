//
//  TableView.swift
//  JobSpot
//
//  Created by Enigma Kod on 13/01/2024.
//

import SwiftUI
import UIKit

class TableView: UIView {
    private let tableView = UITableView()

    var tableview: UITableView { self.tableview }

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

extension TableView {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false

        tableView.backgroundColor = UIColor.white
    }

    private func layout() {
        addSubview(tableView)

        tableView.pinToEdges(to: tableView)
    }
}
