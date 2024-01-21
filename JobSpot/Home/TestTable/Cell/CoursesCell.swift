//
//  CoursesCell.swift
//  JobSpot
//
//  Created by Enigma Kod on 21/01/2024.
//

import UIKit

final class CoursesCell: UITableViewCell {
    var course: KCourses?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with course: KCourses) { self.course = course }
}
