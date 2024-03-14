//
//  ProjectTableViewCell.swift
//  swift_learning
//
//  Created by Mai Xuân Duy on 13/03/2024.
//

import UIKit

class ProjectTableViewCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblLang: UILabel!
    @IBOutlet weak var lblDes: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
