//
//  JobDetailLocationView.swift
//  JobSpot
//
//  Created by Enigma Kod on 15/01/2024.
//

import MapKit
import UIKit

class JobDetailLocationView: UIView {
    private let vStack = stackView()
    private let titleLabel = Label(type: .regular)
    private let locationText = Label(type: .regular)
    private let mapView: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        map.overrideUserInterfaceStyle = .dark
        return map
    }()

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

extension JobDetailLocationView {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false

        titleLabel.text = "Location"
        titleLabel.font = .systemFont(ofSize: 14, weight: .bold)

        locationText.text = "Overlook Avenue, Belleville, NJ, USA"
        locationText.font = .systemFont(ofSize: 12, weight: .regular)
        locationText.textColor = UIColor(rgb: 0x524B6B)

        mapView.layer.cornerRadius = 10
        mapView.clipsToBounds = true
    }

    private func layout() {
        vStack.addArrangedSubview(titleLabel)
        vStack.setCustomSpacing(10, after: titleLabel)
        vStack.addArrangedSubview(locationText)

        vStack.setCustomSpacing(20, after: locationText)
        vStack.addArrangedSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: vStack.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: vStack.trailingAnchor),
            mapView.heightAnchor.constraint(equalToConstant: 150),
        ])

        addSubview(vStack)
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: topAnchor),
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: AppSize.horizontalPadding),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -AppSize.horizontalPadding),
            vStack.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
