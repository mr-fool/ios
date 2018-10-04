//
//  ViewController.swift
//  PresentationDemo
//
//  Created by Shaheed Murji on 2018-09-27.
//  Copyright © 2018 Shaheed Murji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //Outlet for the Ball Image
    @IBOutlet weak var ballView: UIImageView!
    //Helper Function to transform the object
    func transform(for translation: CGPoint) -> CGAffineTransform {
        //Using predefined function to track image
        let moveBy = CGAffineTransform(translationX: translation.x, y: translation.y)
        //Applying a rotation to the image by a constant amount
        let rotation = -sin(translation.x / (ballView.frame.width * 4.0))
        //Returning the translation of the image
        return moveBy.rotated(by: rotation)
    }
    //Pan Gesture Recognizer function for Action
    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        //Switch case to determine what action to take
        switch sender.state {
        //If the object is currently being moved
        case .changed:
            let translation = sender.translation(in: view)
            ballView.transform = transform(for: translation)
        //If the user lets go of the object
        case .ended:
            //Animation snippet to make it look cool
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.0, options: [], animations: {
                //Return to the original position
                self.ballView.transform = .identity
            }, completion: nil)
        //Must be included
        default:
            break
        }
        
    }
}

