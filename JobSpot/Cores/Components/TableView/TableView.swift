//
//  TableView.swift
//  JobSpot
//
//  Created by Enigma Kod on 13/01/2024.
//

import SwiftUI
import UIKit

class CustomTableViewCell: UITableViewCell {
    let customLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(customLabel)
        
        NSLayoutConstraint.activate([
            customLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            customLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    func configure(withText text: String) { customLabel.text = text }
}

class CustomTableViewContainerView: UIView, UITableViewDelegate, UITableViewDataSource {
    var tableViewHeightConstraint: NSLayoutConstraint?

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 100
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
        tableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentSize" {
            tableView.heightAnchor.constraint(equalToConstant: tableView.contentSize.height).isActive = true
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        cell.textLabel?.text = "Row \(indexPath.row)"
        cell.configure(withText: "Row \(indexPath.row)")
        return cell
    }
}

//class CustomView: UIView {
//    let stackVieww = stackView()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        style()
//        layout()
//    }
//
//    @available(*, unavailable)
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func style() {
//        translatesAutoresizingMaskIntoConstraints = false
//    }
//
//    private func layout() {
//        let tableViewContainer = CustomTableViewContainerView()
//        stackVieww.addArrangedSubview(tableViewContainer)
//        
//        addSubview(stackVieww)
//        NSLayoutConstraint.activate([
//            stackVieww.topAnchor.constraint(equalTo: topAnchor),
//            stackVieww.leadingAnchor.constraint(equalTo: leadingAnchor),
//            stackVieww.trailingAnchor.constraint(equalTo: trailingAnchor),
//            
//            stackVieww.bottomAnchor.constraint(equalTo: bottomAnchor),
//            stackVieww.heightAnchor.constraint(greaterThanOrEqualToConstant: 200),
////            tableViewContainer.widthAnchor.constraint(equalToConstant: 50),
//        ])
//    }
//}
