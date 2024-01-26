//
//  HomeVCBaseCell.swift
//  JobSpot
//
//  Created by Enigma Kod on 24/01/2024.
//

import UIKit

protocol HomeVcBaseCellActions {}

class HomeVcBaseCell: UITableViewCell, HomeVcBaseCellActions {
    class var id: String { return "cellId" }
}
