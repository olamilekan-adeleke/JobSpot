//
//  HomeHeaderView.swift
//  JobSpot
//
//  Created by Enigma Kod on 12/08/2023.
//

import SwiftUI
import UIKit

class HomeHeaderView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: self.bounds.width, height: 60)
    }
}

struct HomeHeaderViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        return HomeHeaderView()
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

 struct HomeHeaderView_Preview: PreviewProvider {
    static var previews: some View {
        return HomeHeaderViewRepresentable()
    }
 }
