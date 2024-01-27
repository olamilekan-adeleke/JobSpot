//
//  CompanyDetailsJobsView.swift
//  JobSpot
//
//  Created by Enigma Kod on 27/01/2024.
//

import UIKit

class CompanyDetailsJobsView: UIView {
    private let vStack = stackView()
    private let tableView: UITableView = .init()
    
    private let ITEM_COUNT: Int = 5
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
    
extension CompanyDetailsJobsView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int { return ITEM_COUNT }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return 1 }
        
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat { return 10 }
        
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
        frame = bounds
        layoutIfNeeded()

        return tableView.contentSize
    }
        
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat { return 200 }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
    
extension CompanyDetailsJobsView {
    private func style() {
        backgroundColor = UIColor(red: 0.975, green: 0.975, blue: 0.975, alpha: 1)
        vStack.backgroundColor = UIColor(red: 0.975, green: 0.975, blue: 0.975, alpha: 1)
            
        tableView.backgroundColor = UIColor(red: 0.975, green: 0.975, blue: 0.975, alpha: 1)
        tableView.separatorColor = .clear
            
        tableView.sectionHeaderTopPadding = 0
    }
        
    private func layout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = false
            
        vStack.addArrangedSubview(tableView)
            
        addSubview(vStack)
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: topAnchor),
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            vStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            vStack.heightAnchor.constraint(equalToConstant: (200 + 20) * CGFloat(ITEM_COUNT)),
        ])
    }
}
