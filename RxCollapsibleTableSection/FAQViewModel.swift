//
//  FAQViewModel.swift
//  RxCollapsibleTableSection
//
//  Created by Seunghun Lee on 2017-07-24.
//  Copyright © 2017 Seunghun Lee. All rights reserved.
//

import Foundation

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

class FAQViewModel {
  var items: [FAQItem]
  var isCollapsed = true

  init(items: [FAQItem]) {
    self.items = items
  }
}
