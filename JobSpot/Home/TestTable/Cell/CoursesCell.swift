//
//  CoursesCell.swift
//  JobSpot
//
//  Created by Enigma Kod on 21/01/2024.
//

import UIKit

final class CoursesCell: UITableViewCell {
    var course: KCourses?

    private let vStack = stackView()
    private let courseImage = BoxView()
    private let title = Label(type: .regular)
    private let des = Label(type: .thin)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with course: KCourses) {
        self.course = course

        courseImage.backgroundColor = .gray.withAlphaComponent(0.2)
        courseImage.layer.cornerRadius = 8

        title.text = course.name
        title.font = .systemFont(ofSize: 14, weight: .bold)

        des.text = course.description.trimmingCharacters(in: .whitespacesAndNewlines)
        des.font = .systemFont(ofSize: 12, weight: .light)
        des.textColor = .lightGray
        des.numberOfLines = 4
        des.textAlignment = .left
    }

    private func setupUI() {
        vStack.addArrangedSubview(title)

        vStack.setCustomSpacing(5, after: title)
        vStack.addArrangedSubview(des)

        vStack.setCustomSpacing(5, after: des)
        vStack.addArrangedSubview(courseImage)
        NSLayoutConstraint.activate([
            courseImage.heightAnchor.constraint(equalToConstant: 60.h()),
            courseImage.leadingAnchor.constraint(equalTo: vStack.leadingAnchor),
            courseImage.trailingAnchor.constraint(equalTo: vStack.trailingAnchor),
        ])

//        hStack.setCustomSpacing(15, after: vStack)
//        hStack.addArrangedSubview(locationImage)
//        let imageHeightCons = locationImage.heightAnchor.constraint(equalToConstant: 80.h())
//        imageHeightCons.priority = UILayoutPriority(999)
//        NSLayoutConstraint.activate([
//            imageHeightCons,
//            courseImage.widthAnchor.constraint(equalToConstant: 60.w()),
//        ])

        contentView.addSubview(vStack)
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            vStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            vStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            vStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
}
