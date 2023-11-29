//
//  image_view.swift
//  JobSpot
//
//  Created by Enigma Kod on 29/11/2023.
//
import UIKit

class CustomImage: UIView {
    let name: String
    
    init?(name: String) {
        self.name = name
        super.init()
        
        self.setUp()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set Up

    func setUp() {
        self.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: name)?.withRenderingMode(.alwaysOriginal)
        
        var imageView: UIImageView
        imageView = UIImageView(frame: CGRectMake(10, 50, 100, 300))
        imageView.image = image
        self.addSubview(imageView)
    }
}
