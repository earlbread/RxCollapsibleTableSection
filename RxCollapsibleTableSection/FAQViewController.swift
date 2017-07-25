//
//  FAQViewController.swift
//  RxCollapsibleTableSection
//
//  Created by Seunghun Lee on 2017-07-24.
//  Copyright © 2017 Seunghun Lee. All rights reserved.
//

import UIKit

class FAQViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!

  let viewModel = FAQViewModel()
  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.dataSource = viewModel
  }

}

