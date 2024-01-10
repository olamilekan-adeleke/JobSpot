////
////  HomeBannerView.swift
////  JobSpot
////
////  Created by Enigma Kod on 12/08/2023.
////
//
//import SwiftUI
//import UIKit
//
//class HomeBannerView: UIView {
//    let container = makeView()
//    let textLabel = makeLabel(withText: "50% off \ntake any courses", ofSize: 18, weight: .light, debug: false)
//    let button = makeButton(withText: "Join Now")
//    let personImage = makeImageView(named: "banner_lady")
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        style()
//        layout()
//    }
//
//    @available(*, unavailable)
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override var intrinsicContentSize: CGSize {
//        return CGSize(width: bounds.width, height: 145)
//    }
//
//    private func style() {
//        container.backgroundColor = UIColor.red
//        container.layer.backgroundColor = UIColor(red: 0.075, green: 0.004, blue: 0.376, alpha: 1).cgColor
//        container.layer.cornerRadius = 6
//
//        textLabel.numberOfLines = 0
//        container.addSubview(textLabel)
//
//        button.layer.cornerRadius = 6
//        button.configuration = UIButton.Configuration.filled()
//        button.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20)
//        button.configuration?.baseBackgroundColor = UIColor(red: 1, green: 0.573, blue: 0.157, alpha: 1)
//        container.addSubview(button)
//
//        personImage.contentMode = .scaleAspectFit
//        container.addSubview(personImage)
//
//        addSubview(container)
//    }
//
//    private func layout() {
//        // Container
//        NSLayoutConstraint.activate([
//            container.widthAnchor.constraint(equalToConstant: bounds.width),
//            container.heightAnchor.constraint(equalToConstant: 140),
//            container.leadingAnchor.constraint(equalTo: leadingAnchor),
//            container.trailingAnchor.constraint(equalTo: trailingAnchor),
//        ])
//
//        // Title Label
//        textLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
//        NSLayoutConstraint.activate([
//            textLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 24),
//            textLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
//        ])
//
//        // Button
//        NSLayoutConstraint.activate([
//            button.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -18),
//            button.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
//        ])
//
//        // Image
//        NSLayoutConstraint.activate([
//            personImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10),
//            personImage.bottomAnchor.constraint(equalTo: container.bottomAnchor),
//            personImage.heightAnchor.constraint(equalToConstant: 140),
//        ])
//    }
//}
//
//struct HomeBannerViewRepresentable: UIViewRepresentable {
//    func makeUIView(context: Context) -> some UIView {
//        return HomeBannerView()
//    }
//
//    func updateUIView(_ uiView: UIViewType, context: Context) {}
//}
//
//struct HomeBannerView_Preview: PreviewProvider {
//    static var previews: some View {
//        return HomeBannerViewRepresentable()
//    }
//}
