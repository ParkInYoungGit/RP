//
//  ListTableViewCell.swift
//  LifeCycle
//
//  Created by YOUNG on 2021/07/21.
//

import UIKit

protocol ListTableViewCellDelegate: class {
    func checkBoxToggle(sender: ListTableViewCell)
}

class ListTableViewCell: UITableViewCell {

    weak var delegate: ListTableViewCellDelegate?
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var checkBoxButton: UIButton!
    
    @IBAction func checkToggled(_ sender: UIButton) {
        delegate?.checkBoxToggle(sender: self)
    }
}
