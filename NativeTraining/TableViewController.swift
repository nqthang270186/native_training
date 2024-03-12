//
//  TableViewController.swift
//  test
//
//  Created by DKI on 12.03.2024.
//

import UIKit

class TableViewController: UIViewController {
    var names: [String] = ["Tí",
                              "Tèo",
                              "Hùng",
                              "Lam",
                              "Thuỷ",
                              "Tuấn",
                              "Trung",
                              "Hạnh"]

    @IBOutlet weak var tblListName: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tblListName.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cellName")
        tblListName.delegate = self
        tblListName.dataSource = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellName", for: indexPath) as? TableViewCell
        if cell == nil {
            cell = TableViewCell()
        }
        cell?.lblName.text = names[indexPath.row]
        return cell!
    }
    
    
}
