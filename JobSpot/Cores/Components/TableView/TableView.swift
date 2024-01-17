//
//  TableView.swift
//  JobSpot
//
//  Created by Enigma Kod on 13/01/2024.
//

import SwiftUI
import UIKit

// class TableView: UIView {
//    private let tableView = UITableView()
//
//    var tableview: UITableView { self.tableview }
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
// }
//
// extension TableView {
//    private func style() {
//        translatesAutoresizingMaskIntoConstraints = false
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//
//        tableView.backgroundColor = UIColor.white
//    }
//
//    private func layout() {
//        addSubview(tableView)
//
//        tableView.pinToEdges(to: tableView)
//    }
// }

class CustomTableViewCell: UITableViewCell {
    // Add any additional UI elements or properties you need for your custom cell
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
        // Customize your cell's appearance here
        addSubview(customLabel)
        
        // Add constraints for the label (centered in the cell)
        NSLayoutConstraint.activate([
            customLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            customLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
//            customLabel.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func configure(withText text: String) {
        // Configure the cell with the provided text
        customLabel.text = text
    }
}

class CustomTableViewContainerView: UIView, UITableViewDelegate, UITableViewDataSource {
    var tableViewHeightConstraint: NSLayoutConstraint?

    
    let tableView: UITableView = {
        let tableView = UITableView()
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 100
        tableView.isScrollEnabled = false
        // Configure your table view as needed
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    private func setupViews() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            tableView.heightAnchor.constraint(equalTo: tableViewHeightConstraint)
        ])
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Register your custom cell class
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
        
        
        tableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if(keyPath == "contentSize") {
                // Here you could get from change or simple get it directly from the table view
            tableViewHeightConstraint?.constant = tableView.contentSize.height
            
            tableView.heightAnchor.constraint(equalToConstant: tableView.contentSize.height).isActive = true
        }
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in your table view
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) // as! CustomTableViewCell
        // Configure your custom cell with data
        cell.textLabel?.text = "Row \(indexPath.row)"
//        cell.configure(withText: "Row \(indexPath.row)")
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
}

class CustomView: UIView {
    let stackVieww = stackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        style()
        layout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    private func layout() {
        let tableViewContainer = CustomTableViewContainerView()
        stackVieww.addArrangedSubview(tableViewContainer)
        
//        tableViewContainer.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        
        // Add stackView to the main view
        addSubview(stackVieww)
//        stackVieww.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackVieww.topAnchor.constraint(equalTo: topAnchor),
            stackVieww.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackVieww.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            stackVieww.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackVieww.heightAnchor.constraint(greaterThanOrEqualToConstant: 200)
//            tableViewContainer.widthAnchor.constraint(equalToConstant: 50),
        ])
        
//        tableViewContainer.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}
//
//class CustomVc: UIViewController {
//    let vStack = stackView()
//    let body = CustomView()
//
//    override func viewDidLoad() {
//        style()
//        layout()
//    }
//}
//
//extension CustomVc {
//    private func style() {}
//
//    private func layout() {
//        vStack.addSubview(body)
//
//        vStack.addSubview(body)
//        body.pinToEdges(to: vStack)
//    }
//}
//
//struct Textxtxttx_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomVc().showPreview()
//    }
//}
