//
//  ChooseACityTableViewCell.swift
//  Clock
//
//  Created by 임윤휘 on 2022/04/25.
//

import UIKit

class ChooseACityTableViewCell: UITableViewCell {
    @IBOutlet weak var cityNameLabel: UILabel!
    
    static let identifier = "ChooseACityTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureView(_ cityName: String){
        self.cityNameLabel.text = cityName
    }
}
