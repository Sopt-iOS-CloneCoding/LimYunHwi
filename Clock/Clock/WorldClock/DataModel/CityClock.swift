//
//  CityClock.swift
//  Clock
//
//  Created by limyunhwi on 2022/04/13.
//

import Foundation

struct CityClock {
    let cityName: String
    var time: Date
}

extension CityClock {
    static let sampleData: [CityClock] = [
        CityClock(cityName: "서울, 대한민국", time: Date()),
        CityClock(cityName: "뉴욕, 미국", time: Date()),
        CityClock(cityName: "파리, 프랑스", time: Date()),
        CityClock(cityName: "가로보네, 보츠와나", time: Date()),
        CityClock(cityName: "가자", time: Date()),
        CityClock(cityName: "도쿄, 일본", time: Date()),
        CityClock(cityName: "도하, 카타르", time: Date()),
        CityClock(cityName: "툴루카, 멕시코", time: Date()),
        CityClock(cityName: "튀니스, 튀니지", time: Date()),
        CityClock(cityName: "함부르크, 독일", time: Date()),
        CityClock(cityName: "튀니스, 튀니지", time: Date()),
        CityClock(cityName: "튀니스, 튀니지", time: Date()),
        CityClock(cityName: "튀니스, 튀니지", time: Date()),
        CityClock(cityName: "튀니스, 튀니지", time: Date()),
        CityClock(cityName: "튀니스, 튀니지", time: Date()),
        CityClock(cityName: "튀니스, 튀니지", time: Date()),
        CityClock(cityName: "튀니스, 튀니지", time: Date()),
        CityClock(cityName: "튀니스, 튀니지", time: Date()),
        CityClock(cityName: "튀니스, 튀니지", time: Date()),
        CityClock(cityName: "튀니스, 튀니지", time: Date()),
        CityClock(cityName: "튀니스, 튀니지", time: Date()),
    ]
}
