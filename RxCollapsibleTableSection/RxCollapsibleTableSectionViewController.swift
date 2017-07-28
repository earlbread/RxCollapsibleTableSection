//
//  RxCollapsibleTableSectionViewController.swift
//  RxCollapsibleTableSection
//
//  Created by Seunghun Lee on 2017-07-25.
//  Copyright © 2017 Seunghun Lee. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

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

  let disposeBag = DisposeBag()
  let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, String>>()

  @IBOutlet weak var tableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()

    let sections = [
      SectionModel(model: "Section1", items: ["Item 1-1", "Item 1-2", "Item 1-3"]),
      SectionModel(model: "Section2", items: ["Item 2-1", "Item 2-2", "Item 2-3"]),
      SectionModel(model: "Section3", items: ["Item 3-1", "Item 3-2", "Item 3-3"])
    ]

    dataSource.configureCell = { (dataSource, tableView, indexPath, sectionItem) in
      guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ItemCell.self), for: indexPath) as? ItemCell else {
        fatalError("Could not dequeue cell with ItemCell")
      }

      cell.titleLabel.text = sectionItem

      return cell
    }

    Observable.just(sections)
      .bind(to: tableView.rx.items(dataSource: dataSource))
      .disposed(by: disposeBag)
  }

}
