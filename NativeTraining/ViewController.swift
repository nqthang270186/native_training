//
//  ViewController.swift
//  swift_learning
//
//  Created by Mai Xuân Duy on 04/03/2024.
//

import UIKit

class ViewController: UIViewController {
    
    var popup : Popup!
    @IBOutlet weak var tableUserView: UITableView!
    @IBOutlet weak var editSearch: UITextField!
    @IBOutlet weak var lblPageNumber: UILabel!
    var tableUserData: [Person] = []
    var tableUserFilter: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        // Do any additional setup after loading the view.
        tableUserView.dataSource = self
        tableUserView.delegate = self
        self.registerTableViewCells()
        gotoPage(pageNum: 0)
//        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
//        view.addGestureRecognizer(tap)
    }
//    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) { self.popup.removeFromSuperview() }
    
    @IBAction func showMessage(sender: UIButton) {
        let alertController = UIAlertController(title: "Welcome to My First App", message: "Hello World", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func search_onChanged(_ sender: Any) {
        if ((self.editSearch.text?.isEmpty) == true) {
            tableUserFilter = tableUserData
        } else {
            tableUserFilter.removeAll()
            for userData in tableUserData {
                if userData.login.contains(self.editSearch.text!) {
                    tableUserFilter.append(userData)
                }
            }
        }
        DispatchQueue.main.async{
            self.tableUserView.reloadData()
        }
    }
    @IBAction func search_onClick(_ sender: Any) {
        self.popup = Popup(frame: self.view.frame)
        self.view.addSubview(popup)
    }
    
}

extension ViewController{
    private func gotoPage(pageNum: Int){
        self.lblPageNumber.text = String(pageNum)
        NetworkManager().fetchData(fromIndex: pageNum * 50) { arr in
            self.tableUserData = arr
            self.tableUserFilter = arr
            DispatchQueue.main.async{
                self.tableUserView.reloadData()
                self.editSearch.text = ""
            }
        }
    }
    
    @IBAction func next_onClick(_ sender: Any) {
        guard let pageNum:Int = Int(self.lblPageNumber.text ?? "0") else { return }
        gotoPage(pageNum: pageNum + 1)
    }
    @IBAction func pre_onClick(_ sender: Any) {
        guard let pageNum:Int = Int(self.lblPageNumber.text ?? "0") else { return }
        if pageNum < 1 { return }
        gotoPage(pageNum: pageNum - 1)
    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let secondViewController: SecondViewViewController? = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewViewController
        guard let valid = secondViewController else { return }
        valid.urlUser = (self.tableUserFilter[indexPath.row] as Person).login
        navigationController?.pushViewController(valid, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableUserFilter.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PersonViewCell") as? PersonViewCell {
            cell.showViewCell(userInfo: self.tableUserFilter[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    private func registerTableViewCells() {
        let userViewCell = UINib(nibName: "PersonViewCell", bundle: nil)
        self.tableUserView.register(userViewCell, forCellReuseIdentifier: "PersonViewCell")
    }
}
