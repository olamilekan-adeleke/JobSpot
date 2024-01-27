//
//  HomeJobCountStatsView.swift
//  JobSpot
//
//  Created by Enigma Kod on 13/01/2024.
//

import UIKit

class HomeJobCountStatsView: HomeVcBaseCell {
    override class var id: String { return "HomeJobCountStatsView" }

    private let header = Label(type: .bold, str: "Find Your Job")

    private let statsBox = BoxView()
    private let remoteJobStats = StatsBoxView(count: "44.5K", title: "Remote Jobs", color: Config.remoteStatsColor, image: UIImage(named: "headhunting"))
    private let fullTimeJobStats = StatsBoxView(count: "66.8K", title: "Full Time", color: Config.fullTimeStatsColor)
    private let partTimeJobStats = StatsBoxView(count: "38.9K", title: "Part Time", color: Config.partTimeStatsColor)

    private let vStack = stackView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setup()
    }

    private func setup() {
        style()
        layout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMoveToSuperview() {
        selectedBackgroundView?.isHidden = true
    }
}

extension HomeJobCountStatsView {
    private func style() {
//        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(red: 0.975, green: 0.975, blue: 0.975, alpha: 1)
    }

    private func layout() {
        let box = BoxView()
        box.heightAnchor.constraint(equalToConstant: 20).isActive = true
        vStack.addArrangedSubview(box)

        vStack.addArrangedSubview(header)

        statsBox.addSubview(remoteJobStats)
        statsBox.addSubview(fullTimeJobStats)
        statsBox.addSubview(partTimeJobStats)
        NSLayoutConstraint.activate([
            remoteJobStats.topAnchor.constraint(equalTo: statsBox.topAnchor),
            remoteJobStats.leadingAnchor.constraint(equalTo: statsBox.leadingAnchor),
            remoteJobStats.bottomAnchor.constraint(equalTo: statsBox.bottomAnchor),

            fullTimeJobStats.topAnchor.constraint(equalTo: statsBox.topAnchor),
            fullTimeJobStats.trailingAnchor.constraint(equalTo: statsBox.trailingAnchor),

            partTimeJobStats.topAnchor.constraint(equalTo: fullTimeJobStats.bottomAnchor, constant: 20),
            partTimeJobStats.trailingAnchor.constraint(equalTo: statsBox.trailingAnchor),
            partTimeJobStats.bottomAnchor.constraint(equalTo: statsBox.bottomAnchor),
        ])
        vStack.setCustomSpacing(15, after: header)
        vStack.addArrangedSubview(statsBox)

        contentView.addSubview(vStack)
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            vStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            vStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }

    enum Config {
        static let remoteStatsColor = UIColor(red: 0.686, green: 0.925, blue: 0.996, alpha: 1)
        static let fullTimeStatsColor = UIColor(red: 0.745, green: 0.686, blue: 0.996, alpha: 1)
        static let partTimeStatsColor = UIColor(red: 1, green: 0.838, blue: 0.68, alpha: 1)
    }
}

// MARK: - SubView

class StatsBoxView: UIView {
    private let countLabel = Label(type: .regular)
    private let titleLabel = Label(type: .regular)
    private let vStack = stackView()

    let count: String
    let title: String
    let image: UIImage?
    let imageView: UIImageView = ImageView(image: UIImage(named: "headhunting"))

    init(count: String, title: String, color: UIColor, image: UIImage? = nil) {
        self.count = count
        self.title = title
        self.image = image
        vStack.backgroundColor = color

        super.init(frame: .zero)

        style()
        layout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        vStack.layer.cornerRadius = 6
        vStack.clipsToBounds = true
        vStack.alignment = .center
        vStack.distribution = .fill

        countLabel.text = count
        countLabel.font = .systemFont(ofSize: 16, weight: .bold)

        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: 14, weight: .thin)
    }

    private func layout() {
        let view = UIView()
        vStack.addArrangedSubview(view)
        vStack.setCustomSpacing(16, after: view)

        if image != nil {
            imageView.image = image
            imageView.contentMode = .scaleAspectFit
            vStack.setCustomSpacing(40, after: view)
            vStack.addArrangedSubview(imageView)
            vStack.setCustomSpacing(14, after: imageView)

            imageView.widthAnchor.constraint(equalToConstant: 34).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 34).isActive = true
        }

        vStack.addArrangedSubview(countLabel)

        vStack.setCustomSpacing(8, after: countLabel)
        vStack.addArrangedSubview(titleLabel)

        vStack.setCustomSpacing(14, after: titleLabel)
        vStack.addArrangedSubview(UIView())

        addSubview(vStack)
        NSLayoutConstraint.activate([
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            vStack.topAnchor.constraint(equalTo: topAnchor),
            vStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            vStack.widthAnchor.constraint(equalToConstant: 160.w()),
        ])
    }
}
