//
//  StopwatchTableViewCell.swift
//  Clock
//
//  Created by 임윤휘 on 2022/06/13.
//

import UIKit

class StopwatchTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(title: String, time: String){
        self.titleLabel.text = title
        self.timeLabel.text = time
    }
}
