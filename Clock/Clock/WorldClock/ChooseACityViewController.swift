//
//  ChooseACityViewController.swift
//  Clock
//
//  Created by 임윤휘 on 2022/04/25.
//

import UIKit

class ChooseACityViewController: UIViewController {
    @IBOutlet weak var cityTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityTableView.dataSource = self
        
        configureTableViewCell()
    }
    
    private func configureTableViewCell(){
        let nib = UINib(nibName: ChooseACityTableViewCell.identifier, bundle: nil)
        cityTableView.register(nib, forCellReuseIdentifier: ChooseACityTableViewCell.identifier)
    }
}

extension ChooseACityViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CityClock.sampleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChooseACityTableViewCell.identifier, for: indexPath) as? ChooseACityTableViewCell else {return UITableViewCell()}
        
        cell.configureView(CityClock.sampleData[indexPath.row].cityName)
        
        return cell
    }
}
