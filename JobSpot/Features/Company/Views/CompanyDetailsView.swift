//
//  CompanyDetailsView.swift
//  JobSpot
//
//  Created by Enigma Kod on 16/01/2024.
//

import UIKit

class CompanyDetailsView: UIView {
    private let vStack = ScrollableStackView()
    private let headerView = CompanyDetailHeaderView()
    private let actionButton = CompanyDetailActionButtons()
    private let subTabview = CompanyDetailsSegmentedControlView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        style()
        layout();
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CompanyDetailsView {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        vStack.showsVerticalScrollIndicator = false
    }

    private func layout() {
        vStack.add(view: headerView)
        
        vStack.setCustomSpacing(20, after: headerView)
        vStack.add(view: actionButton)
        
        vStack.setCustomSpacing(20, after: actionButton)
        vStack.add(view: subTabview.view)
        
        addSubview(vStack)
        vStack.pinToEdges(to: self)
    }
}
