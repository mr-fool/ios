//
//  ViewController.swift
//  hw2
//
//  
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate  {


    @IBOutlet weak var nameField: UITextField!
    
    
    
    @IBOutlet weak var numberField: UITextField!
    
    @IBOutlet weak var nameTracker: UILabel!
    
    @IBOutlet weak var numberTracker: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        something.isHidden = true
       
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if nameField.text == "" {
            nameTracker.text = "Number field has been cleaned"
        }
        else {
        nameTracker.text = "Hello \(nameField.text ?? "nothing")"
        }
        
    }
    
    @IBAction func setNumberButton(_ sender: Any) {
        if numberField.text == "" {
            numberTracker.text = "Number field has been cleaned"
        }
        else {
        numberTracker.text = "The entered number is: \(numberField.text ?? "nothing")"
    
        }
    }
    @IBOutlet weak var sliderValue: UILabel!
    
    @IBAction func sliderAction(_ sender: UISlider) {
        sliderValue.text = String(Int(sender.value * 100) )
    }
    
  
    @IBOutlet weak var switch1: UISwitch!
    
    
    @IBOutlet weak var switch2: UISwitch!
    

    @IBAction func something(_ sender: Any) {
        let alert = UIAlertController(title: "Something was done.", message: "Everything's fine. You can breathe easy now and continue.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        
        self.present(alert, animated: true)
    }
    
    @IBOutlet weak var something: UIButton!
    
    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            switch1.isHidden = false
            switch2.isHidden = false
            something.isHidden = true
        case 1:
           switch1.isHidden = true
           switch2.isHidden = true
           something.isHidden = false
        default:
           
            break
        }
    }
    

    

}
