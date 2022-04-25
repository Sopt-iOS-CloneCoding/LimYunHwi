//
//  CityClock.swift
//  Clock
//
//  Created by limyunhwi on 2022/04/13.
//

import Foundation

struct CityClock {
    let cityName: String
    let countryName: String
    var time: Date
}

extension CityClock {
    static let sampleData: [CityClock] = [
        CityClock(cityName: "서울", countryName: "대한민국", time: Date()),
        CityClock(cityName: "뉴욕", countryName: "미국", time: Date()),
        CityClock(cityName: "파리", countryName: "프랑스", time: Date()),
        CityClock(cityName: "가로보네", countryName: "보츠와나", time: Date()),
        CityClock(cityName: "괌", countryName: "괌", time: Date()),
        CityClock(cityName: "도쿄", countryName: "일본", time: Date()),
        CityClock(cityName: "도하", countryName: "카타르", time: Date()),
        CityClock(cityName: "툴루카", countryName: "멕시코", time: Date()),
        CityClock(cityName: "튀니스", countryName: "튀니지", time: Date()),
        CityClock(cityName: "함부르크", countryName: "독일", time: Date()),
        CityClock(cityName: "함부르크", countryName: "독일", time: Date()),
        CityClock(cityName: "함부르크", countryName: "독일", time: Date()),
        CityClock(cityName: "함부르크", countryName: "독일", time: Date()),
        CityClock(cityName: "함부르크", countryName: "독일", time: Date()),
        CityClock(cityName: "함부르크", countryName: "독일", time: Date()),
        CityClock(cityName: "함부르크", countryName: "독일", time: Date()),
        CityClock(cityName: "함부르크", countryName: "독일", time: Date()),
        CityClock(cityName: "함부르크", countryName: "독일", time: Date()),
        CityClock(cityName: "함부르크", countryName: "독일", time: Date()),
        CityClock(cityName: "함부르크", countryName: "독일", time: Date()),
        CityClock(cityName: "함부르크", countryName: "독일", time: Date())
    ]
}
