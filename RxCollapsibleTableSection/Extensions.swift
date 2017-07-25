//
//  Extensions.swift
//  RxCollapsibleTableSection
//
//  Created by Seunghun Lee on 2017-07-25.
//  Copyright © 2017 Seunghun Lee. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
  class var identity: String {
    return String(describing: self)
  }
}
