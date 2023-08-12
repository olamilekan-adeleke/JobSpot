//
//  SharedComponent.swift
//  JobSpot
//
//  Created by Enigma Kod on 12/08/2023.
//

import UIKit

func makeLabel(
    withText text: String,
    ofSize: CGFloat = 17,
    weight: UIFont.Weight = .medium,
    textAlignment: NSTextAlignment = .left,
    debug: Bool = false
) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    label.backgroundColor = debug ? UIColor.yellow : UIColor.clear
    label.textAlignment = textAlignment
    label.font = UIFont.systemFont(ofSize: ofSize, weight: weight)

    return label
}

func makeSubLabel(withText text: String, debug: Bool = false) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    label.textColor = .gray
    label.backgroundColor = debug ? UIColor.yellow : UIColor.clear
    label.font = UIFont.systemFont(ofSize: 12)
    label.numberOfLines = 0
    return label
}

func makeBolLabel(withText text: String, debug: Bool = false) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    label.backgroundColor = debug ? UIColor.yellow : UIColor.clear
    label.backgroundColor = debug ? UIColor.yellow : UIColor.clear
    label.font = UIFont.boldSystemFont(ofSize: 17)
    return label
}

func makeSwitch(isOn value: Bool) -> UISwitch {
    let theSwitch = UISwitch()
    theSwitch.translatesAutoresizingMaskIntoConstraints = false
    theSwitch.isOn = value
    return theSwitch
}

func makeProgressLine() -> UIProgressView {
    let progressView = UIProgressView()
    progressView.translatesAutoresizingMaskIntoConstraints = false
    progressView.tintColor = .gray
    return progressView
}

func makeButton(withText text: String) -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle(text, for: .normal)
    button.backgroundColor = .systemTeal
    return button
}

func makeView(debug: Bool = false) -> UIView {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = debug ? .red : .clear
    return view
}

func makeTextField(withPlaceHolderText text: String) -> UITextField {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.placeholder = text
    textField.backgroundColor = .lightGray
    return textField
}

func makeImageView(named: String, debug: Bool = false) -> UIImageView {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    imageView.image = UIImage(named: named)
    imageView.backgroundColor = debug ? UIColor.yellow : UIColor.clear
    return imageView
}

func makeStack(axis: NSLayoutConstraint.Axis, debug: Bool = false) -> UIStackView {
    let stack = UIStackView()
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = axis
    stack.spacing = 8
    stack.distribution = .fill
    stack.alignment = .fill
    stack.backgroundColor = debug ? UIColor.yellow : UIColor.clear
    return stack
}

func makeScrollView() -> UIScrollView {
    let scrollView = UIScrollView()
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    return scrollView
}

public extension NSLayoutConstraint {
    @objc func setActiveBreakable(priority: UILayoutPriority = UILayoutPriority(900)) {
        self.priority = priority
        isActive = true
    }
}

// extension UINavigationController {
//    override open var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
// }
//
// extension UIColor {
//    static let darkBlue = UIColor(red: 10/255, green: 132/255, blue: 255/255, alpha: 1)
//    static let darkGreen = UIColor(red: 48/255, green: 209/255, blue: 88/255, alpha: 1)
//    static let darkOrange = UIColor(red: 255/255, green: 149/255, blue: 0/255, alpha: 1)
//    static let darkRed = UIColor(red: 255/255, green: 59/255, blue: 48/255, alpha: 1)
//    static let darkTeal = UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 1)
//    static let darkYellow = UIColor(red: 255/255, green: 204/255, blue: 0/255, alpha: 1)
//    static let offBlack = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
// }
