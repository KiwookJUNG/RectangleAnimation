//
//  ViewController.swift
//  RectangleAnimation
//
//  Created by 정기욱 on 2019/11/28.
//  Copyright © 2019 kiwook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var brownView: UIView!
    @IBOutlet weak var brownViewX: NSLayoutConstraint!
    @IBOutlet weak var brownViewY: NSLayoutConstraint!
    
    
    @IBOutlet weak var greenView: UIView!
    
    @IBOutlet weak var greenTop: NSLayoutConstraint!
    @IBOutlet weak var greenViewX: NSLayoutConstraint!
    
    @IBOutlet weak var blueView: UIView!
    
    @IBOutlet weak var blueLeft: NSLayoutConstraint!
    @IBOutlet weak var blueTop: NSLayoutConstraint!
    
    
    @IBOutlet weak var redView: UIView!
    
    @IBOutlet weak var redLeft: NSLayoutConstraint!
    @IBOutlet weak var redViewY: NSLayoutConstraint!
    
//    @IBAction func btn(_ sender: Any) {
//
//        UIView.animate(withDuration: 1.9) {
////            self.brownViewBottom = self.brownViewBottom.changeMultiplier(value: 0.75)
////            self.brownViewTrailing = self.brownViewTrailing.changeMultiplier(value: 0.75)
////            self.view.layoutIfNeeded()
//        }
//
//    }
    
    
    
    @IBAction func remove(_ sender: Any) {
        UIView.animate(withDuration: 1.0) {
            self.brownViewX = self.brownViewX.changeMultiplier(value: 2.5)
            self.brownViewY = self.brownViewY.changeMultiplier(value: 2.5)
            self.greenViewX = self.greenViewX.changeMultiplier(value: 2.5)
            self.greenTop.constant = -150
            self.blueLeft.constant = -150
            self.blueTop.constant = -150
            self.redLeft.constant = -150
            self.redViewY = self.redViewY.changeMultiplier(value: 2.5)
            
            self.view.layoutIfNeeded()
        }
    }
    
    
    @IBAction func comeBack(_ sender: Any) {
        UIView.animate(withDuration: 1.0) {
            self.brownViewX = self.brownViewX.changeMultiplier(value: 1.5)
            self.brownViewY = self.brownViewY.changeMultiplier(value: 1.5)
            self.greenViewX = self.greenViewX.changeMultiplier(value: 1.5)
            self.greenTop.constant = 0
            self.blueLeft.constant = 0
            self.blueTop.constant = 0
            self.redLeft.constant = 0
            self.redViewY = self.redViewY.changeMultiplier(value: 1.5)
            self.view.layoutIfNeeded()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


extension NSLayoutConstraint {
    func changeMultiplier(value : CGFloat) -> NSLayoutConstraint {
        
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint(item: self.firstItem,
                                               attribute: self.firstAttribute,
                                               relatedBy: self.relation,
                                               toItem: self.secondItem,
                                               attribute: self.secondAttribute,
                                               multiplier: value,
                                               constant: self.constant)
        
        newConstraint.priority = self.priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        
        return newConstraint
    }
}
