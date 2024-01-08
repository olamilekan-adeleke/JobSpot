//
//  ImageView.swift
//  JobSpot
//
//  Created by Enigma Kod on 08/01/2024.
//

import UIKit

class CustomImageView: UIImageView {
    var customImageName: String? {
        didSet {
            if let imageName = customImageName {
                image = UIImage(named: imageName)
            }
        }
    }

    override init(image: UIImage?) {
        super.init(image: image)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false

        contentMode = .scaleAspectFit
//        layer.cornerRadius = 8
        clipsToBounds = true
        backgroundColor = .clear
    }
}
