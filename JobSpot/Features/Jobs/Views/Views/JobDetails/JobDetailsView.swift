//
//  JobDetailsView.swift
//  JobSpot
//
//  Created by Enigma Kod on 15/01/2024.
//

import UIKit

class JobDetailsView: UIView {
    private let vScrollableStack = ScrollableStackView()
    private let headerView = JobDetailsHeaderView()
    private let tagsView = JobDetailsTagView()
    private let jobDescriptionAndRequirements = JobDetailDescriptionAndRequirements()
    private let locationView = JobDetailLocationView()
    private let jobInformationView = JobDetailsInformationView()
    private let facilitiesView = JobDetailFacilitiesView()
    private let applyButton = JobDetailsButtonView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        style()
        layout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension JobDetailsView {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false

        vScrollableStack.showsVerticalScrollIndicator = false
    }

    private func layout() {
        vScrollableStack.add(view: headerView)

        vScrollableStack.setCustomSpacing(20, after: headerView)
        vScrollableStack.add(view: tagsView)

        vScrollableStack.setCustomSpacing(20, after: tagsView)
        vScrollableStack.add(view: jobDescriptionAndRequirements)

        vScrollableStack.setCustomSpacing(20, after: jobDescriptionAndRequirements)
        vScrollableStack.add(view: locationView)

        vScrollableStack.setCustomSpacing(40, after: locationView)
        vScrollableStack.add(view: jobInformationView)

        vScrollableStack.setCustomSpacing(40, after: jobInformationView)
        vScrollableStack.add(view: facilitiesView)

        vScrollableStack.setCustomSpacing(40, after: facilitiesView)
        vScrollableStack.add(view: applyButton)

        vScrollableStack.setCustomSpacing(20, after: applyButton)
        vScrollableStack.add(view: UIView())

        addSubview(vScrollableStack)
        vScrollableStack.pinToEdges(to: self)
    }
}
