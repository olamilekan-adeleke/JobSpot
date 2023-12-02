//
//  image_view.swift
//  JobSpot
//
//  Created by Enigma Kod on 29/11/2023.
//
import UIKit

class CustomImage: UIView {
    let name: String
    let type: ImageType
    
    init?(name: String, type: ImageType) {
        self.name = name
        self.type = type
        super.init()
        
        setUp()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set Up

    func setUp() {
        translatesAutoresizingMaskIntoConstraints = false
        var image: UIImage? {
            if type == .local {
                return UIImage(named: name)?.withRenderingMode(.alwaysOriginal)
            } else {
                return UIImage(systemName: name)?.withRenderingMode(.alwaysOriginal)
            }
        }
        
        var imageView: UIImageView
        imageView = UIImageView(frame: CGRectMake(10, 50, 100, 300))
        imageView.image = image
        addSubview(imageView)
    }
    
    enum ImageType {
        case local, icon
    }
}
