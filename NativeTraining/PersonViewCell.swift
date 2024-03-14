//
//  PersonViewCell.swift
//  swift_learning
//
//  Created by Mai Xuân Duy on 11/03/2024.
//

import UIKit
import Kingfisher

class PersonViewCell: UITableViewCell {
    
    @IBOutlet weak var imageAvata: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDetail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func showViewCell(userInfo: Person){
        guard let imageLink = userInfo.avatar_url else {return}
        self.lblTitle.text = userInfo.login
        self.lblDetail.text = userInfo.login
        let url = URL(string: imageLink)
        imageAvata.kf.setImage(with: url)
        imageAvata.layer.cornerRadius = 10
    }
}
