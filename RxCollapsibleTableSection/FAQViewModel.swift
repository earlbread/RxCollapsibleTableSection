//
//  FAQViewModel.swift
//  RxCollapsibleTableSection
//
//  Created by Seunghun Lee on 2017-07-24.
//  Copyright © 2017 Seunghun Lee. All rights reserved.
//

import Foundation

var faqs = [
  FAQItem(question: "What is Lorem Ipsum?",
          answer: "Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
  FAQItem(question: "Where does it come from?",
          answer: "It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old."),
  FAQItem(question: "Why do we use it?",
          answer: "The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.")
]

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
