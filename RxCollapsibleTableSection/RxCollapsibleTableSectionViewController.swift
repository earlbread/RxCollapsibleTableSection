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

class ItemCell: UITableViewCell {
  @IBOutlet weak var titleLabel: UILabel!
}

struct Section {
  var title: String
  var items: [String]
  var collapsed: Bool

  init(title: String, items: [String], collapsed: Bool = false) {
    self.title = title
    self.items = items
    self.collapsed = collapsed
  }
}

class RxCollapsibleTableSectionViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
