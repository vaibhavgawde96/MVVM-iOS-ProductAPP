//
//  LoginViewController.swift
//  Product
//
//  Created by Vaibhav Gawde on 13/06/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginView: UIView!
    
    @IBOutlet weak var loginButton: UIButton!
    
    let uiCHanges = UIChanges()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiCHanges.uiViewRound(view: loginView,value: 16)
        uiCHanges.uiButtonRound(button: loginButton)
        self.navigationItem.hidesBackButton = true

    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newVC = storyBoard.instantiateViewController(identifier: "MainDashboardVC") as! MainDashboardViewController
        
        self.navigationController?.pushViewController(newVC, animated: true)
    }
}
