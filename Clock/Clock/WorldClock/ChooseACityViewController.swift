//
//  ChooseACityViewController.swift
//  Clock
//
//  Created by 임윤휘 on 2022/04/25.
//

import UIKit

class ChooseACityViewController: UIViewController {
    @IBOutlet weak var cityTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var mutableCityColocks: [CityClock] = []
    var sectionTitles: [String] = []
    var cityColockDict = [String : [CityClock]]()
    var headerTitles: [String] = []
    var isSearching: Bool = false
    var cityClocks: [CityClock] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityTableView.dataSource = self
        searchBar.delegate = self
        
        cityClocks = getCityClocksToSystem()
        mutableCityColocks = cityClocks
        
        setSectionTitles()
        configureTableViewCell()
        configureSearchBar()
        configureTableView()
    }
    
    private func configureTableViewCell(){
        let nib = UINib(nibName: ChooseACityTableViewCell.identifier, bundle: nil)
        cityTableView.register(nib, forCellReuseIdentifier: ChooseACityTableViewCell.identifier)
    }
    
    private func configureTableView() {
        cityTableView.sectionIndexColor = .systemOrange
    }
    
    private func configureSearchBar() {
        if let cancelButton = searchBar.value(forKey: "cancelButton") as? UIButton {
            cancelButton.isEnabled = true
        }
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
        
        sectionTitles = Array(Set(mutableCityColocks.compactMap{
            cityColockDict[String($0.cityName.prefix(1))] = [CityClock]()
            return String($0.cityName.prefix(1))
        }))
        sectionTitles.sort()
        mutableCityColocks.forEach{
            cityColockDict[String($0.cityName.prefix(1))]?.append($0)
            
        }
    }
}

extension ChooseACityViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return mutableCityColocks.count
        }
        
        return cityColockDict[sectionTitles[section]]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChooseACityTableViewCell.identifier, for: indexPath) as? ChooseACityTableViewCell else {return UITableViewCell()}
        
        if isSearching {
            cell.configureView(mutableCityColocks[indexPath.row].cityName, mutableCityColocks[indexPath.row].countryName)
            return cell
        }
        
        cell.configureView(cityColockDict[sectionTitles[indexPath.section]]?[indexPath.row].cityName ?? "", cityColockDict[sectionTitles[indexPath.section]]?[indexPath.row].countryName ?? "")
        
        return cell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        if isSearching {
            return nil
        }
        
        return sectionTitles
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if isSearching {
            return 1
        }
        
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if isSearching {
            return nil
        }
        
        return sectionTitles[section]
    }
}

extension ChooseACityViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.dismiss(animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        isSearching = true
        
        if searchText.isEmpty {
            mutableCityColocks = cityClocks
            isSearching = false
            self.cityTableView.reloadData()
            return
        }
        var temp = [CityClock]()

        isSearching = true
        
        for city in mutableCityColocks {
            if city.cityName.uppercased().contains(searchText.uppercased()) {
                temp.append(city)
            }
        }
        
        mutableCityColocks = temp
        self.cityTableView.reloadData()
    }
}
