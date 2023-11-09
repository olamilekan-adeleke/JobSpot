//
//  CustomLabels.swift
//  JobSpot
//
//  Created by Enigma Kod on 09/11/2023.
//

import UIKit

class Label: UILabel {
    let type: LabelType
    let debug: Bool

    init(type: LabelType = .regular, debug: Bool = false) {
        self.type = type
        self.debug = debug
        super.init(frame: .zero)
        self.commonInit()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        self.textColor = .black
        self.font = UIFont.systemFont(ofSize: 14)
        self.textAlignment = .left

        setUp()
    }

    enum LabelType {
        case subTitle, regular, bold, custom
    }
}

extension Label {
    private func setUp() {
        switch self.type { case .subTitle:
            self.textColor = .gray
            self.backgroundColor = self.debug ? UIColor.yellow : UIColor.clear
            self.font = UIFont.systemFont(ofSize: 12, weight: .thin)
        case .regular:
            self.backgroundColor = self.debug ? UIColor.yellow : UIColor.clear
            self.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        case .bold:
            self.backgroundColor = self.debug ? UIColor.yellow : UIColor.clear
            self.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        case .custom:
            break
        }
    }
}
