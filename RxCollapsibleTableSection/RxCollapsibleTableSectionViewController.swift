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
  var section: Int = 0
  var collapsed = false

  override func awakeFromNib() {
    addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapHeader)))
  }

  func tapHeader(_ gestureRecognizer: UITapGestureRecognizer) {
    print("Section\(section) is tapped, \(collapsed)")
    collapsed = !collapsed
  }
}

class ItemCell: UITableViewCell {
  @IBOutlet weak var titleLabel: UILabel!
}

struct Section {
  var title: String
  var items: [String]
  var collapsed = false

  init(title: String, items: [String], collapsed: Bool = false) {
    self.title = title
    self.items = items
    self.collapsed = collapsed
  }
}

extension Section: SectionModelType {
  init(original: Section, items: [String]) {
    self.title = original.title
    self.items = original.items
  }
}

class RxCollapsibleTableSectionViewController: UIViewController {

  let disposeBag = DisposeBag()
  let dataSource = RxTableViewSectionedReloadDataSource<Section>()
  var sections = [Section]()

  @IBOutlet weak var tableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()

    sections = [
      Section(title: "Section1", items: ["Item 1-1", "Item 1-2", "Item 1-3"]),
      Section(title: "Section2", items: ["Item 2-1", "Item 2-2", "Item 2-3"]),
      Section(title: "Section3", items: ["Item 3-1", "Item 3-2", "Item 3-3"])
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

    tableView.rx
      .setDelegate(self)
      .disposed(by: disposeBag)
  }

}

extension RxCollapsibleTableSectionViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let identifier = String(describing: SectionHeader.self)
    guard let header = tableView.dequeueReusableCell(withIdentifier: identifier)
      as? SectionHeader else {
        fatalError("Could not dequeue cell with \(identifier)")
    }

    header.section = section
    header.titleLabel.text = sections[section].title
    header.frame = CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 44.0)

    let headerView = UIView()
    headerView.addSubview(header)

    return headerView
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 44.0
  }
}
