//
//  TestTableViewController.swift
//  JobSpot
//
//  Created by Enigma Kod on 21/01/2024.
//

import SwiftUI
import UIKit

// MARK: - TestTableViewController

class TestTableViewController: UIViewController {
    private let tableView = UITableView()

    enum Section {
        case character(items: [Character])
        case location(items: [KLocation])
        case course(items: [KCourses])

        var title: String {
            switch self {
                case .character: return "Characters"
                case .location: return "Locations"
                case .course: return "Courses"
            }
        }
    }

    enum CellIdentifier {
        static var character = "CharacterCell"
        static var location = "LocationCell"
        static var course = "CourseCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        layoutTable()

        // Register cell classes
        tableView.register(CharacterCell.self, forCellReuseIdentifier: CellIdentifier.character)
        tableView.register(LocationCell.self, forCellReuseIdentifier: CellIdentifier.location)
        tableView.register(CoursesCell.self, forCellReuseIdentifier: CellIdentifier.course)

        title = "Wizard Work Wiki"
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func layoutTable() {
//        tableView.backgroundColor = .yellow
        tableView.translatesAutoresizingMaskIntoConstraints = false

//        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension

        view.addSubview(tableView)
        tableView.pinToEdges(to: view)
    }
}

// MARK: - UITableViewDataSource

extension TestTableViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        createDataSource().count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch createDataSource()[section] {
            case .character(let items): return items.count
            case .location(let items): return items.count
            case .course(let items): return items.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = createDataSource()[indexPath.section]

        switch section {
            case .character(let items):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.character, for: indexPath) as? CharacterCell else {
                    return UITableViewCell()
                }
                let item = items[indexPath.row]
                cell.configure(with: item)
//                cell.textLabel?.text = "Character"
                return cell

            case .location(let items):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.location, for: indexPath) as? LocationCell else {
                    return UITableViewCell()
                }
                let item = items[indexPath.row]
                cell.configure(with: item)
                cell.textLabel?.text = "Location"
                return cell

            case .course(let items):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.course, for: indexPath) as? CoursesCell else {
                    return UITableViewCell()
                }
                let item = items[indexPath.row]
                cell.configure(with: item)
                cell.textLabel?.text = "Courses"
                return cell
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        createDataSource()[section].title
    }
}

private extension TestTableViewController {
    func createDataSource() -> [Section] {
        let charactersItem = Section.character(items: Character.exampleList)
        let locationsItem = Section.location(items: KLocation.harryPotterLocations)
        let coursesItem = Section.course(items: KCourses.harryPotterCourses)

        return [charactersItem, locationsItem, coursesItem]
    }
}

struct TastTableView_Previews: PreviewProvider {
    static var previews: some View {
        TestTableViewController().showPreview()
    }
}
