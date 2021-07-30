//
//  MenuCell.swift
//  ably
//
//  Created by YOUNG on 2021/07/15.
//

import Foundation
import UIKit
import PagingKit

class MenuCell: PagingMenuViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    
        override public var isSelected: Bool {
            didSet {
                if isSelected {
                    titleLabel.textColor = .black
                    titleLabel?.font = UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)
                } else {
                    titleLabel.textColor = .lightGray
                    titleLabel.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)

                }
            }
        }
    
}
