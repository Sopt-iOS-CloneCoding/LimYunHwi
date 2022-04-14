//
//  WorldClockTableViewCell.swift
//  Clock
//
//  Created by limyunhwi on 2022/04/13.
//

import UIKit

class WorldClockTableViewCell: UITableViewCell {
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var timeDifferenceLabel: UILabel!
    @IBOutlet weak var timeSlotLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
