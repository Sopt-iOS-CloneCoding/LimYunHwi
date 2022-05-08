//
//  WorldClockViewController.swift
//  Clock
//
//  Created by limyunhwi on 2022/04/13.
//

import UIKit

class WorldClockViewController: UIViewController {
    @IBOutlet var editButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    var doneButton: UIBarButtonItem?
    var cityClocks: [CityClock] = [] {
        didSet{
            editButton.isHidden = cityClocks.isEmpty
            //ADD 도시 추가 기능 구현 시 구현 예정
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //FIX 정리 필요
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        configureTabBarItem()
    }
    
    private func configureTabBarItem(){
        doneButton = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(tapDoneBarButton))
        
        editButton.isHidden = cityClocks.isEmpty
    }
    
    @objc private func tapDoneBarButton() {
        self.navigationItem.leftBarButtonItem = editButton
        self.tableView.setEditing(false, animated: true)
    }
    
    @IBAction func tapEditBarButton(_ sender: UIBarButtonItem) {
        self.navigationItem.leftBarButtonItem = doneButton
        self.tableView.setEditing(true, animated: true)
    }
    
    @IBAction func tapAddClock(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "ChooseACity", bundle: nil)
        guard let chooseACityViewController = storyboard.instantiateViewController(withIdentifier: "ChooseACityViewController") as? ChooseACityViewController else {return}
        
        self.present(chooseACityViewController, animated: true)
    }
}

extension WorldClockViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cityClocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WorldClockTableViewCell", for: indexPath) as? WorldClockTableViewCell else {return UITableViewCell()}
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        var cityClocks = self.cityClocks
        let cityClock = cityClocks[sourceIndexPath.row]
        cityClocks.remove(at: sourceIndexPath.row)
        cityClocks.insert(cityClock, at: destinationIndexPath.row)
        
        self.cityClocks = cityClocks
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        self.cityClocks.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
        
        if self.cityClocks.isEmpty {
            tapDoneBarButton()
        }
    }
}

extension WorldClockViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
