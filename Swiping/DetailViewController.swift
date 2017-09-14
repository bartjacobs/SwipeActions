//
//  DetailViewController.swift
//  Swiping
//
//  Created by Bart Jacobs on 14/09/2017.
//  Copyright © 2017 Cocoacasts. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: - Properties

    @IBOutlet var detailLabel: UILabel!

    // MARK: -

    var details: String!

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Populate Detail Label
        detailLabel.text = details
    }

}
