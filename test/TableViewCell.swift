//
//  TableViewCell.swift
//  test
//
//  Created by DKI on 12.03.2024.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblName: UILabel!
    
   static let identifier = "TableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
