//
//  CustomHeader.swift
//  swift_learning
//
//  Created by Mai Xuân Duy on 06/03/2024.
//

import UIKit

protocol CustomHeaderDelegate {
    func didBackTap()
}

class CustomHeader: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    
    var delegate: CustomHeaderDelegate?
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        Bundle.main.loadNibNamed("CustomHeader", owner: self, options: nil)
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    @IBAction func backOnClick(_ sender: Any) {
        delegate?.didBackTap()
    }
}
