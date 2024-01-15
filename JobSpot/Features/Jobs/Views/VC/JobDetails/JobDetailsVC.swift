//
//  JobDetailsVC.swift
//  JobSpot
//
//  Created by Enigma Kod on 15/01/2024.
//

import UIKit
import SwiftUI

class JobDetailsVC: UIViewController {
    private let body = JobDetailsView()
    
    override func viewDidLoad() {
        style()
        layout()
    }
}

extension JobDetailsVC {
    private func style() {
        view.backgroundColor = .white
    }

    private func layout() {
        view.addSubview(body)
        body.pinToEdges(to: view)
    }
}


struct JobDetails_Previews: PreviewProvider {
    static var previews: some View {
        JobDetailsVC().showPreview()
    }
}
