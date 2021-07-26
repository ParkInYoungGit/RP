//
//  ExamTableViewCell.swift
//  TableViewExam
//
//  Created by 김우성 on 2021/07/03.
//

import UIKit

protocol ExamTableCellDelegate {
    func didSelect(sender: ExamTableViewCell )
}


class ExamTableViewCell: UITableViewCell {
    
    @IBOutlet weak var customSwitch: UISwitch!
    var delegate: ExamTableCellDelegate?
    var index: Int?

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func didSelected(_ sender: UISwitch) {
        delegate?.didSelect(sender: self)
        }
    
    
    
    
}
