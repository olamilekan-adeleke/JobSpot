//
//  CompanyDetailHeaderView.swift
//  JobSpot
//
//  Created by Enigma Kod on 16/01/2024.
//

import UIKit

class CompanyDetailHeaderView: UIView {
    private let boxView = BoxView()
    
    private let companyHeaderImage = ImageView(image: UIImage())
    
    private let vStack = stackView()
    private let jobTitleLabel = Label(type: .regular)
    private let locationAndTimeLabel = Label(type: .regular)
    
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

extension CompanyDetailHeaderView {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        boxView.backgroundColor = .yellow
        
        vStack.alignment = .center
        vStack.backgroundColor = Config.bannerBackgroundColor
        vStack.layoutMargins = UIEdgeInsets(top: 35, left: 30, bottom: 20, right: 30)
        vStack.isLayoutMarginsRelativeArrangement = true
        
        companyHeaderImage.backgroundColor = Config.imageBackgroundColor
        companyHeaderImage.layer.cornerRadius = 84.h() / 2
        companyHeaderImage.image = UIImage(named: "google_icon")?.imageWithInsets(insetDimen: 12)
        companyHeaderImage.contentMode = .scaleAspectFill
        
        jobTitleLabel.text = "UI/UX Designer"
        jobTitleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        
        locationAndTimeLabel.text = "Google  •  California  •  1 day ago"
        locationAndTimeLabel.font = .systemFont(ofSize: 16, weight: .light)
        locationAndTimeLabel.textColor = UIColor(rgb: 0x0D0140)
    }
    
    private func layout() {
        vStack.addArrangedSubview(jobTitleLabel)
        vStack.setCustomSpacing(8, after: jobTitleLabel)
        vStack.addArrangedSubview(locationAndTimeLabel)
        
        boxView.addSubview(vStack)
        
        addSubview(companyHeaderImage)
        NSLayoutConstraint.activate([
            companyHeaderImage.topAnchor.constraint(equalTo: topAnchor),
            companyHeaderImage.heightAnchor.constraint(equalToConstant: 84.h()),
            companyHeaderImage.widthAnchor.constraint(equalToConstant: 84.h()),
            companyHeaderImage.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
        companyHeaderImage.layer.zPosition = 1
        
        addSubview(boxView)
        vStack.pinToEdges(to: boxView)
        NSLayoutConstraint.activate([
            boxView.topAnchor.constraint(equalTo: companyHeaderImage.bottomAnchor, constant: -20),
            boxView.leadingAnchor.constraint(equalTo: leadingAnchor),
            boxView.trailingAnchor.constraint(equalTo: trailingAnchor),
            boxView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    enum Config {
        static let bannerBackgroundColor = UIColor(rgb: 0xF3F2F2)
        static let imageBackgroundColor = UIColor(rgb: 0xAFECFE)
    }
}
