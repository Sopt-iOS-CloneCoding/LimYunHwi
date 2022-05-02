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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityTableView.dataSource = self
        cityColocks = getCityClocksToSystem()
        
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
}

extension ChooseACityViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityColocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChooseACityTableViewCell.identifier, for: indexPath) as? ChooseACityTableViewCell else {return UITableViewCell()}
        
        cell.configureView(cityColocks[indexPath.row].cityName, cityColocks[indexPath.row].countryName)
        
        return cell
    }
}
