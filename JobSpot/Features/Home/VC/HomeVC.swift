//
//  HomeVC.swift
//  JobSpot
//
//  Created by Enigma Kod on 10/01/2024.
//

import SwiftUI
import UIKit

class HomeVC: UIViewController {
    private let tableView = UITableView()

//    private let headerView = HomeHeaderView()
//    private let homeBanner = HomeBannerView()
//    private let jobStatsView = HomeJobCountStatsView()
//    private let homeRecentJobListView = HomeRecentJobListView()
//    private let vScrollableStack = ScrollableStackView()

//    private let homeBody = HomeView()

    private var cellsID = [String]()

    override func viewDidLoad() {
        layout()

        registerAndAddCell(HomeHeaderView.self)
        registerAndAddCell(HomeBannerView.self)
        registerAndAddCell(HomeJobCountStatsView.self)

        tableView.dataSource = self
        tableView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

extension HomeVC {
    private func registerAndAddCell<CellType: HomeVcBaseCell>(_ cellType: CellType.Type) {
        tableView.register(cellType, forCellReuseIdentifier: cellType.id)
        cellsID.append(cellType.id)
    }

    private func layout() {
        view.backgroundColor = UIColor(red: 0.975, green: 0.975, blue: 0.975, alpha: 1)

//        view.addSubview(homeBody)
//        homeBody.pinToEdges(to: view)

//        vScrollableStack.add(view: headerView)
//
//        vScrollableStack.setCustomSpacing(10, after: headerView)
//        vScrollableStack.add(view: homeBanner)
//
//        vScrollableStack.setCustomSpacing(25, after: homeBanner)
//        vScrollableStack.add(view: jobStatsView)
//
//        vScrollableStack.setCustomSpacing(25, after: jobStatsView)
//        vScrollableStack.add(view: homeRecentJobListView.view)
//
//        //        vScrollableStack.setCustomSpacing(30, after: homeRecentJobListView)
//        //        vScrollableStack.add(view: tableViewContainer)
//
//        view.addSubview(vScrollableStack)
//        vScrollableStack.pinToEdgesWithHorizontalPadding(to: view)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorColor = UIColor.clear

        tableView.rowHeight = UITableView.automaticDimension

        view.addSubview(tableView)
        tableView.pinToEdgesWithHorizontalPadding(to: view)
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellsID.count
    }

//    func numberOfSections(in tableView: UITableView) -> Int {
//        return cellsID.count
//    }

//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        switch createDataSource()[section] {
//            case .character(let items): return items.count
//            case .location(let items): return items.count
//            case .course(let items): return items.count
//        }
//    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id = cellsID[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as? HomeVcBaseCell else {
            return UITableViewCell()
        }
//        let item = items[indexPath.row]
//        cell.configure(with: item)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.h()
    }

//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 30))
//    }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        createDataSource()[section].title
//    }
}

struct HomeVC_Previews: PreviewProvider {
    static var previews: some View {
        HomeVC().showPreview()
    }
}
