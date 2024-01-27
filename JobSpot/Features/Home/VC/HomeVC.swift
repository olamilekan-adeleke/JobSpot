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
    private var cellsID = [String]()

    override func viewDidLoad() {
        layout()

        registerAndAddCell(HomeHeaderView.self)
        registerAndAddCell(HomeBannerView.self)
        registerAndAddCell(HomeJobCountStatsView.self)
        registerAndAddCell(HomeRecentJobListView.self)

        tableView.dataSource = self
        tableView.delegate = self

        tableView.reloadData()
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

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor.clear
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

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id = cellsID[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as? HomeVcBaseCell else {
            return UITableViewCell()
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.h()
    }
}

struct HomeVC_Previews: PreviewProvider {
    static var previews: some View {
        HomeVC().showPreview()
    }
}
