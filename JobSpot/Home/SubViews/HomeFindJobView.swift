//
//  HomeFindJobView.swift
//  JobSpot
//
//  Created by Enigma Kod on 13/08/2023.
//

import SwiftUI
import UIKit

class HomeFindJobView: UIView {
    let remoateJobContainer = makeView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        style()
        layout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: bounds.width, height: 170)
    }

    private func style() {
        remoateJobContainer.frame = CGRect(x: 0, y: 0, width: 150, height: 170)
        remoateJobContainer.layer.backgroundColor = UIColor(red: 0.686, green: 0.925, blue: 0.996, alpha: 1).cgColor
        remoateJobContainer.layer.cornerRadius = 6
        addSubview(remoateJobContainer)
    }

    private func layout() {
        //
        NSLayoutConstraint.activate([
            remoateJobContainer.heightAnchor.constraint(equalToConstant: 170),
            remoateJobContainer.widthAnchor.constraint(equalToConstant: 150),
            remoateJobContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
}

class HomeFindJobViewItemWidget: UIView {
    let container = makeView()
    let titleLabel = makeLabel(withText: "", ofSize: 16, weight: .bold)
    let subtitleLabel = makeLabel(withText: "", ofSize: 14, weight: .light)

    init(frame: CGRect, title: String, subTitle: String) {
        super.init(frame: frame)
        titleLabel.text = title
        subtitleLabel.text = subTitle

        layout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override var intrinsicContentSize: CGSize { CGSize(width: 150, height: 75) }

    private func layout() {}
}

struct HomeFindJobViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        return HomeFindJobView()
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

struct HomeFindJobView_Preview: PreviewProvider {
    static var previews: some View {
        return HomeFindJobViewRepresentable()
    }
}
