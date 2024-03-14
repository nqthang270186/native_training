//
//  SecondViewViewController.swift
//  swift_learning
//
//  Created by Mai Xuân Duy on 06/03/2024.
//

import UIKit

class SecondViewViewController: UIViewController {
    
    //    apply custom layout
    @IBOutlet weak var viewHeader: CustomHeader!
    @IBOutlet weak var imageAvata: UIImageView!
    @IBOutlet weak var lblFollowers: UILabel!
    @IBOutlet weak var lblFollowing: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCompany: UILabel!
    @IBOutlet weak var lblBlog: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblReposCount: UILabel!
    @IBOutlet weak var tableRepos: UITableView!
    var urlUser : String = ""
    var tableProjectData: [Project] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        apply for navigation
        navigationController?.setNavigationBarHidden(true, animated: false)
        viewHeader.delegate = self
        self.viewHeader.lblTitle.text = "Name"
        tableRepos.dataSource = self
        self.registerTableViewCells()
        self.showDetaileView()
        self.showRepo()
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

extension SecondViewViewController: CustomHeaderDelegate {
    func didBackTap() {
        navigationController?.popViewController(animated: true)
    }
}

extension SecondViewViewController{
    func showDetaileView(){
        NetworkManager().fetchData(userId: urlUser) { person in
            DispatchQueue.main.async {
                self.viewHeader.lblTitle.text = person.name
                self.imageAvata.kf.setImage(with: URL(string: person.avatar_url!))
                self.imageAvata.layer.cornerRadius = 30
                self.imageAvata.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
                self.lblFollowers.text = "Followers: \(person.followers!)"
                self.lblFollowers.text = "Following: \(person.following!)"
                self.lblName.text = person.name
                self.lblCompany.text = person.company
                self.lblBlog.text = person.blog
                self.lblLocation.text = person.location
                self.lblReposCount.text = "Repos: \(person.public_repos!)"
            }
        }
    }
    
    func showRepo(){
        NetworkManager().fetchRepoData(userId: urlUser) { arr in
            self.tableProjectData = arr
            DispatchQueue.main.async {
                self.tableRepos.reloadData()
            }
        }
    }
}

extension SecondViewViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableProjectData.count > 5 ? 5 : self.tableProjectData.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectTableViewCell") as? ProjectTableViewCell {
            cell.lblName.text = (self.tableProjectData[indexPath.row] as Project).name
            cell.lblLang.text = (self.tableProjectData[indexPath.row] as Project).language ?? "N/A"
            cell.lblDes.text = (self.tableProjectData[indexPath.row] as Project).description ?? "N/A"
            return cell
        }
        return UITableViewCell()
    }
    
    private func registerTableViewCells() {
        let userViewCell = UINib(nibName: "ProjectTableViewCell", bundle: nil)
        self.tableRepos.register(userViewCell, forCellReuseIdentifier: "ProjectTableViewCell")
    }
}



