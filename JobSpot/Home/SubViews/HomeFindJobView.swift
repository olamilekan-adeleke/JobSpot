////
////  HomeFindJobView.swift
////  JobSpot
////
////  Created by Enigma Kod on 13/08/2023.
////
//
//import SwiftUI
//import UIKit
//
//class HomeFindJobView: UIView {
//    private let headingLabel = makeLabel(withText: "Find Your Job", ofSize: 16, weight: .bold)
//    private let remoteJobContainer = HomeFindJobViewItemWidget(frame: .zero, title: "44.5k", subTitle: "Remote Job")
//    private let fulltimeJobContainer = HomeFindJobViewItemWidget(frame: .zero, title: "66.8k", subTitle: "Full Time")
//    private let partTimeJobContainer = HomeFindJobViewItemWidget(frame: .zero, title: "38.9k", subTitle: "Part Time")
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
//        return CGSize(width: bounds.width, height: 270)
//    }
//
//    private func style() {
//        addSubview(headingLabel)
//
//        remoteJobContainer.layer.backgroundColor = UIColor(red: 0.686, green: 0.925, blue: 0.996, alpha: 1).cgColor
//        remoteJobContainer.layer.cornerRadius = 6
//        addSubview(remoteJobContainer)
//
//        fulltimeJobContainer.layer.backgroundColor = UIColor(red: 0.745, green: 0.686, blue: 0.996, alpha: 1).cgColor
//        fulltimeJobContainer.layer.cornerRadius = 6
//        addSubview(fulltimeJobContainer)
//
//        partTimeJobContainer.layer.backgroundColor = UIColor(red: 1, green: 0.838, blue: 0.68, alpha: 1).cgColor
//        partTimeJobContainer.layer.cornerRadius = 6
//        addSubview(partTimeJobContainer)
//    }
//
//    private func layout() {
//        NSLayoutConstraint.activate([
//            headingLabel.topAnchor.constraint(equalTo: topAnchor),
//            headingLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
//        ])
//
//        // Boxes
//        let topAnchor = headingLabel.bottomAnchor
//        let halfScreenWidth: CGFloat = (UIScreen.main.bounds.width / 2) - 14 - 10
//
//        NSLayoutConstraint.activate([
//            remoteJobContainer.topAnchor.constraint(equalTo: topAnchor, constant: 10),
//            remoteJobContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
//            remoteJobContainer.widthAnchor.constraint(equalToConstant: halfScreenWidth),
//            remoteJobContainer.heightAnchor.constraint(equalToConstant: 170),
//
//            fulltimeJobContainer.topAnchor.constraint(equalTo: topAnchor, constant: 10),
//            fulltimeJobContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
//            fulltimeJobContainer.widthAnchor.constraint(equalToConstant: halfScreenWidth),
//            fulltimeJobContainer.heightAnchor.constraint(equalToConstant: 75),
//
//            partTimeJobContainer.bottomAnchor.constraint(equalTo: remoteJobContainer.bottomAnchor),
//            partTimeJobContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
//            partTimeJobContainer.widthAnchor.constraint(equalToConstant: halfScreenWidth),
//            partTimeJobContainer.heightAnchor.constraint(equalToConstant: 75),
//        ])
//    }
//}
//
//class HomeFindJobViewItemWidget: UIView {
//    private let container = makeView()
//    private let titleLabel = makeLabel(withText: "", ofSize: 16, weight: .bold)
//    private let subtitleLabel = makeLabel(withText: "", ofSize: 14, weight: .light)
//
//    init(frame: CGRect, title: String, subTitle: String) {
//        super.init(frame: frame)
//        titleLabel.text = title
//        subtitleLabel.text = subTitle
//        self.translatesAutoresizingMaskIntoConstraints = false
//        layout()
//    }
//
//    @available(*, unavailable)
//    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
//
//    override var intrinsicContentSize: CGSize { CGSize(width: 150, height: 75) }
//
//    private func layout() {
//        container.addSubview(titleLabel)
//        container.addSubview(subtitleLabel)
//
//        addSubview(container)
//
//        NSLayoutConstraint.activate([
//            container.widthAnchor.constraint(equalToConstant: frame.width),
//            container.heightAnchor.constraint(equalToConstant: frame.height),
//        ])
//
//        NSLayoutConstraint.activate([
//            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -5),
//            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
//
//            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
//            subtitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
//        ])
//    }
//}
//
//struct HomeFindJobViewRepresentable: UIViewRepresentable {
//    func makeUIView(context: Context) -> some UIView {
//        return HomeFindJobView()
//    }
//
//    func updateUIView(_ uiView: UIViewType, context: Context) {}
//}
//
//struct HomeFindJobView_Preview: PreviewProvider {
//    static var previews: some View {
//        return HomeFindJobViewRepresentable()
//    }
//}
