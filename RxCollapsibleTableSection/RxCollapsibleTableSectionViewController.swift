//
//  RxCollapsibleTableSectionViewController.swift
//  RxCollapsibleTableSection
//
//  Created by Seunghun Lee on 2017-07-25.
//  Copyright © 2017 Seunghun Lee. All rights reserved.
//

import UIKit

class SectionHeader: UITableViewCell {
  @IBOutlet weak var titleLabel: UILabel!
}

class RxCollapsibleTableSectionViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
