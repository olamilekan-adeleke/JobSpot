//
//  JobDetailsView.swift
//  JobSpot
//
//  Created by Enigma Kod on 15/01/2024.
//

import UIKit

class JobDetailsView: UIView {
    private let vScrollableStack = ScrollableStackView()
    private let headerView = JobDetailsHeaderView()
    
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

extension JobDetailsView {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        vScrollableStack.showsVerticalScrollIndicator = false
    }

    private func layout() {
        vScrollableStack.add(view: headerView)
       
        addSubview(vScrollableStack)
        vScrollableStack.pinToEdges(to: self)
    }
}
