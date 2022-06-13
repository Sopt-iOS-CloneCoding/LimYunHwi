//
//  StopwatchViewController.swift
//  Clock
//
//  Created by limyunhwi on 2022/04/13.
//

import UIKit

class StopwatchViewController: UIViewController {
    @IBOutlet weak var lapTableView: UITableView!
    
    var laps: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension StopwatchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return laps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.lapTableView.dequeueReusableCell(withIdentifier: "StopwatchTableViewCell", for: indexPath) as? StopwatchTableViewCell else {return UITableViewCell()}
        
        cell.configureCell(title: "랩 \(indexPath.row)", time: "00.00.00")
        
        return cell
    }
}
