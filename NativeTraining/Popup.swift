//
//  Popup.swift
//  swift_learning
//
//  Created by Mai Xuân Duy on 14/03/2024.
//

import UIKit

class Popup: UIView {
    
    @IBOutlet weak var btnCancel: UIButton!
    
    var tap: UITapGestureRecognizer?
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
    }
    
    func xibSetup(frame: CGRect){
//        let tap = UITapGestureRecognizer(target: self, action: #selector(self.btnCancelTapped(_:)))
//        self.addGestureRecognizer(tap)
        
        let view = loadXib()
        addSubview(view)
//        self.sendSubviewToBack(view)

        let tap = UITapGestureRecognizer(target: self, action: #selector(self.btnCancelTapped(_:)))
        
        tap.delegate = self
        self.addGestureRecognizer(tap)
        self.tap = tap

    }
    
    func loadXib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "Popup", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options:nil).first as? UIView
        return view!
    }
    @IBAction func confirm_onClick(_ sender: Any) {
    }
    @IBAction func cancel_onClick(_ sender: Any) {
        print("cancel_onClick")
        self.removeFromSuperview()
    }
    
    @objc func btnCancelTapped(_ sender: UITapGestureRecognizer? = nil){
        print("btnCancelTapped")
        self.removeFromSuperview()
    }
}

extension Popup: UIGestureRecognizerDelegate {

    // Only handle this for the background tap gesture
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
//        guard gestureRecognizer == tap, let backgroundView = gestureRecognizer.view else {
//            return true
//        }
//
//        let touchLocation = touch.location(in: backgroundView)
//        return !self.frame.contains(touchLocation)
//        
////        CGPoint locationInView = [touch locationInView:self.parentView];
////        if (CGRectContainsPoint(self.subView.frame, locationInView) ) {
////            return NO;
////        } else {
////            return YES;
////        }
//    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view == tap?.view
        }

}
