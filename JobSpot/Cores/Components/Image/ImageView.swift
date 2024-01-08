//
//  ImageView.swift
//  JobSpot
//
//  Created by Enigma Kod on 08/01/2024.
//

import UIKit

// final class ImageView: UIView {
//    let name: String
//    let type: ImageType
//
//    init?(name: String, type: ImageType) {
//        self.name = name
//        self.type = type
//        super.init(frame: .zero)
//
//        setUp()
//    }
//
//    @available(*, unavailable)
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func setUp() {
//        translatesAutoresizingMaskIntoConstraints = false
//
//        var image: UIImage? {
//            if type == .local {
//                return UIImage(named: name)?.withRenderingMode(.alwaysOriginal)
//            } else {
//                return UIImage(systemName: name)?.withRenderingMode(.alwaysOriginal)
//            }
//        }
//
//        let imageView = UIImageView()
//        imageView.image = image
//        addSubview(imageView)
//
//        imageView.pinEdges(to: self)
//    }
//
//    enum ImageType { case local, icon }
// }

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
