//
//  Popup.swift
//  swift_learning
//
//  Created by Mai Xuân Duy on 14/03/2024.
//

import UIKit

class Popup: UIViewController {
    
    var tap: UITapGestureRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.btnCancelTapped(_:)))
        tap.delegate = self
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func btnCancelTapped(_ sender: UITapGestureRecognizer? = nil){
        print("btnCancelTapped")
        self.dismiss(animated: true)
    }

    @IBAction func cancelTapped(_ sender: Any) {
        self.dismiss(animated: true)
        
    }
    
    @IBAction func confirmTapped(_ sender: Any) {
        
    }
}

extension Popup: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return self.view == touch.view
    }
}
