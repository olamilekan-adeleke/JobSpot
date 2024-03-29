////
////  HomeHeaderView.swift
////  JobSpot
////
////  Created by Enigma Kod on 12/08/2023.
////
//
//import SwiftUI
//import UIKit
//
//class HomeHeaderView: UIView {
//    let greetingLabel = makeLabel(withText: "Hello \nKod Enigma.", ofSize: 22, weight: .bold)
//    let personImage = makeImageView(named: "person")
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setUpUI()
//    }
//
//    @available(*, unavailable)
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override var intrinsicContentSize: CGSize {
//        return CGSize(width: bounds.width, height: 60)
//    }
//
//    private func setUpUI() {
//        addSubview(greetingLabel)
//        addSubview(personImage)
//
//        // Text Alignment
//        greetingLabel.textColor = UIColor(red: 0.051, green: 0.004, blue: 0.251, alpha: 1)
//        greetingLabel.numberOfLines = 0
//        NSLayoutConstraint.activate([
//            greetingLabel.topAnchor.constraint(equalTo: topAnchor),
//            greetingLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
//        ])
//
//        // Image
//        personImage.contentMode = .scaleAspectFill
//        personImage.layer.cornerRadius = 46 / 2
//        personImage.clipsToBounds = true
//        NSLayoutConstraint.activate([
//            personImage.widthAnchor.constraint(equalToConstant: 46),
//            personImage.heightAnchor.constraint(equalToConstant: 46),
//            personImage.topAnchor.constraint(equalTo: topAnchor),
//            personImage.trailingAnchor.constraint(equalTo: trailingAnchor),
//        ])
//    }
//}
//
//struct HomeHeaderViewRepresentable: UIViewRepresentable {
//    func makeUIView(context: Context) -> some UIView {
//        return HomeHeaderView()
//    }
//
//    func updateUIView(_ uiView: UIViewType, context: Context) {}
//}
//
//struct HomeHeaderView_Preview: PreviewProvider {
//    static var previews: some View {
//        return HomeHeaderViewRepresentable()
//    }
//}
