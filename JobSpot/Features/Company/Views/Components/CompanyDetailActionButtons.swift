//
//  CompanyDetailActionButtons.swift
//  JobSpot
//
//  Created by Enigma Kod on 16/01/2024.
//

import UIKit

class CompanyDetailActionButtons: UIView {
    private let hStack = stackView(axis: .horizontal)
    private let followButton = BaseButton(viewModel: .init(type: .iconButton, title: "Follow"))
    private let websiteButton = BaseButton(viewModel: .init(type: .iconButton, title: "Visit website"))
    
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

extension CompanyDetailActionButtons {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        hStack.distribution = .equalCentering
        
        let followImage = UIImage(systemName: "plus")?.withTintColor(UIColor.AppColor.appTertiaryColor).imageWithInsets(insetDimen: 5)
        followButton.setImage(followImage!)
        
        //
        let websiteImage = UIImage(systemName: "network")?.withTintColor(UIColor.AppColor.appTertiaryColor).imageWithInsets(insetDimen: 5)
        websiteButton.setImage(websiteImage!)
    }
    
    private func layout() {
        hStack.addArrangedSubview(followButton)
        hStack.addArrangedSubview(websiteButton)
        
        addSubview(hStack)
        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: topAnchor),
            hStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AppSize.horizontalPadding),
            hStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -AppSize.horizontalPadding),
            hStack.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
