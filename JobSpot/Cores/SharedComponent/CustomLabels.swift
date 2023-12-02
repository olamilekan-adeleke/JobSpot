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
    let str: String?

    init(type: LabelType, debug: Bool = false, str: String? = nil) {
        self.type = type
        self.debug = debug
        self.str = str

        super.init(frame: .zero)
        self.commonInit()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = self.debug ? UIColor.yellow : UIColor.clear
        self.textColor = .black
        self.font = getFont()
        self.text = self.str
        self.textAlignment = .left
    }

    enum LabelType {
        case subTitle, regular, bold, thin, custom
    }
}

extension Label {
    private func getFont() -> UIFont {
        switch self.type { case .subTitle:
            self.textColor = .gray
            return UIFont.systemFont(ofSize: 12, weight: .thin)
        case .regular:
            return UIFont.systemFont(ofSize: 14, weight: .regular)
        case .bold:
            return UIFont.systemFont(ofSize: 17, weight: .bold)
        case .thin:
            return UIFont.systemFont(ofSize: 13, weight: .thin)
        case .custom:
            return UIFont.systemFont(ofSize: 14)
        }
    }
}
