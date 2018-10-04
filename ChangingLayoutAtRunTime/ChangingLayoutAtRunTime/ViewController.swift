//
//  ViewController.swift
//  ChangingLayoutAtRunTime
//
//  Created by Kowther Hassan on 2018-10-01.
//  Copyright © 2018 Kowther Hassan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet var edgeConstraint: NSLayoutConstraint!
    @IBOutlet var wrappingView: UIStackView!
    var zeroHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func toggleDistanceControls(_ sender: Any) {
        if zeroHeightConstraint == nil {
            zeroHeightConstraint = wrappingView.heightAnchor
                .constraint(equalToConstant: 0)
        }
        
        let shouldShow = !edgeConstraint.isActive
        // Deactivate constraint first to avoid constraint conflict message
        if shouldShow {
            zeroHeightConstraint.isActive = false
            edgeConstraint.isActive = true
        } else {
            edgeConstraint.isActive = false
            zeroHeightConstraint.isActive = true
        }
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
    }
}
    


