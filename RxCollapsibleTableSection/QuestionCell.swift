//
//  QuestionCell.swift
//  RxCollapsibleTableSection
//
//  Created by Seunghun Lee on 2017-07-24.
//  Copyright © 2017 Seunghun Lee. All rights reserved.
//

import UIKit

class QuestionCell: UITableViewCell {
  @IBOutlet weak var questionLabel: UILabel!
  var item: FAQItem? {
    didSet {
      guard let item = item else {
        return
      }
      questionLabel.text = item.question
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
