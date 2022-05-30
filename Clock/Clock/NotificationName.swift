//
//  NotificationName.swift
//  Clock
//
//  Created by 임윤휘 on 2022/05/16.
//

import Foundation

struct NotificationName{
    enum name: String {
        case chooseACity = "DidChooseACityNotification"
    }
    
    static let chooseACity = Notification.Name(name.chooseACity.rawValue)
}
