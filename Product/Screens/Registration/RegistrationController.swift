//
//  RegistrationController.swift
//  Product
//
//  Created by Vaibhav Gawde on 13/06/23.
//

import UIKit

class RegistrationController: UIViewController {

    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var childView: UIView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    
    let uiCHanges = UIChanges()
 

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        uiCHanges.uiViewRound(view: childView,value: 16)
        uiCHanges.uiButtonRound(button: submitButton)
    
    }
    @IBAction func submitAction(_ sender: UIButton) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newVC = storyBoard.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
        
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    
    
    func validation() -> Bool{
        if nameTextField.text == ""{
            return false
        }
        if emailTextField.text == ""{
            return false
        }
        if ageTextField.text == ""{
            return false
        }
        if numberTextField.text == ""{
            return false
        }
        return true
    }
}
