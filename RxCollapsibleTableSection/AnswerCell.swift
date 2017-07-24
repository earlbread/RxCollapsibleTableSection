//
//  AnswerCell.swift
//  RxCollapsibleTableSection
//
//  Created by Seunghun Lee on 2017-07-24.
//  Copyright © 2017 Seunghun Lee. All rights reserved.
//

import UIKit

class AnswerCell: UITableViewCell {
  @IBOutlet weak var answerLabel: UILabel!
  var item: FAQItem? {
    didSet {
      guard let item = item else {
        return
      }
      answerLabel.text = item.answer
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
