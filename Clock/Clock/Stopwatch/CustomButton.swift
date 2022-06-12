//
//  CustomButton.swift
//  Clock
//
//  Created by 임윤휘 on 2022/06/12.
//

import UIKit

class CustomButton: UIButton {
    
    override func draw(_ rect: CGRect) {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.height / 2
    }
}
