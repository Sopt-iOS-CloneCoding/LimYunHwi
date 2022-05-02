//
//  ChooseACityViewController.swift
//  Clock
//
//  Created by 임윤휘 on 2022/04/25.
//

import UIKit

class ChooseACityViewController: UIViewController {
    @IBOutlet weak var cityTableView: UITableView!
    
    var cityColocks: [CityClock] = []
    var sectionTitles: [String] = []
    var cityColockDict = [String : [CityClock]]()
    var headerTitles: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityTableView.dataSource = self
        cityColocks = getCityClocksToSystem()
        setSectionTitles()
        
        configureTableViewCell()
    }
    
    private func configureTableViewCell(){
        let nib = UINib(nibName: ChooseACityTableViewCell.identifier, bundle: nil)
        cityTableView.register(nib, forCellReuseIdentifier: ChooseACityTableViewCell.identifier)
    }
    
    private func getCityClocksToSystem() -> [CityClock] {
        var cityClocks: [CityClock] = []
        
        for id in TimeZone.knownTimeZoneIdentifiers {
            let local = Locale(identifier: "ko_KR") //Locale.current.identifier
            let cityTimeZone = TimeZone(identifier: id)
            let city = NSTimeZone(name: id)?.name
            
            let dateFormatter = DateFormatter()
            dateFormatter.locale = local
            dateFormatter.timeZone = cityTimeZone
            dateFormatter.dateFormat = "HH:mm"
            
            if let city = city {
                let cityName = city.components(separatedBy: "/")
                if cityName.count >= 2{
                    let cityClock = CityClock(cityName: cityName[1], countryName: "", time: dateFormatter)
                    cityClocks.append(cityClock)
                }
            }
        }
        
        return cityClocks
    }
    
    private func setSectionTitles() {
//        for num in 65...90 {
//            headerTitles.append(UnicodeScalar(num)!.description)
//        }
        
        sectionTitles = Array(Set(cityColocks.compactMap{
            cityColockDict[String($0.cityName.prefix(1))] = [CityClock]()
            return String($0.cityName.prefix(1))
        }))
        sectionTitles.sort()
        cityColocks.forEach{
            cityColockDict[String($0.cityName.prefix(1))]?.append($0)
            
        }
    }
}

extension ChooseACityViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityColockDict[sectionTitles[section]]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChooseACityTableViewCell.identifier, for: indexPath) as? ChooseACityTableViewCell else {return UITableViewCell()}
        
        cell.configureView(cityColockDict[sectionTitles[indexPath.section]]?[indexPath.row].cityName ?? "", cityColockDict[sectionTitles[indexPath.section]]?[indexPath.row].countryName ?? ""
        )
        
        return cell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionTitles
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
}
