//
//  TextView.swift
//  JobSpot
//
//  Created by Enigma Kod on 13/01/2024.
//

import SwiftUI
import UIKit

class TextView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let tableview: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = UIColor.white
        tv.translatesAutoresizingMaskIntoConstraints = false
//        tv.separatorColor = .white
        return tv
    }()

//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.translatesAutoresizingMaskIntoConstraints = false
//
//        setupTableView()
//    }

    override func viewDidLoad() {
//        view.translatesAutoresizingMaskIntoConstraints = false

        setupTableView()
    }

//    @available(*, unavailable)
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

    func setupTableView() {
//        tableview.isScrollEnabled = false
        tableview.delegate = self
        tableview.dataSource = self

        tableview.register(ThirtyDayCell.self, forCellReuseIdentifier: "cellId")

//        addSubview(tableview)
        view.addSubview(tableview)
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: view.topAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableview.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableview.leftAnchor.constraint(equalTo: view.leftAnchor),

//            tableview.topAnchor.constraint(equalTo: topAnchor),
//            tableview.bottomAnchor.constraint(equalTo: bottomAnchor),
//            tableview.rightAnchor.constraint(equalTo: rightAnchor),
//            tableview.leftAnchor.constraint(equalTo: leftAnchor)
        ])
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! ThirtyDayCell
        cell.backgroundColor = UIColor.white
        cell.textLabel?.text = "Row \(indexPath.row + 1)"
        return cell
    }
}

class ThirtyDayCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.selectionStyle = .none
//        translatesAutoresizingMaskIntoConstraints = false
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

 struct TextViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
//        let vc = UIViewController()
//        vc.view = TextView()
        return TextView().view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {}
 }
 struct TextView_Preview: PreviewProvider {
    static var previews: some View {
        return TextViewRepresentable()
    }
 }

//struct TextProvider_Previews: PreviewProvider {
//    static var previews: some View {
//        let vc = TextView()
//        return vc.showPreview()
//    }
//}
