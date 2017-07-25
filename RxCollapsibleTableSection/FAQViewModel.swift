//
//  FAQViewModel.swift
//  RxCollapsibleTableSection
//
//  Created by Seunghun Lee on 2017-07-24.
//  Copyright © 2017 Seunghun Lee. All rights reserved.
//

import Foundation
import UIKit

class FAQItem {
  var rowCount: Int {
    return 1
  }

  var question: String
  var answer: String

  init(question: String, answer: String) {
    self.question = question
    self.answer = answer
  }
}

class FAQViewModel: NSObject {
  var items = [
    FAQItem(question: "What is Lorem Ipsum?",
            answer: "Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
    FAQItem(question: "Where does it come from?",
            answer: "It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old."),
    FAQItem(question: "Why do we use it?",
            answer: "The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.")
  ] 
}

extension FAQViewModel: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return items.count
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items[section].rowCount
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: AnswerCell.identity, for: indexPath)
      as? AnswerCell else {
        fatalError("The cell is not an instance of \(AnswerCell.identity)")
    }

    cell.item = items[indexPath.section]
    return cell
  }
}
