//
//  UIBarButtonItemExtension.swift
//  Clock
//
//  Created by limyunhwi on 2022/04/14.
//

import UIKit

extension UIBarButtonItem {
    var isHidden: Bool {
        get {
            return tintColor == .clear
        }
        set {
            tintColor = newValue ? .clear : .systemOrange
            isEnabled = !newValue
            isAccessibilityElement = !newValue
        }
    }
}
