//
//  UIChanges.swift
//  Product
//
//  Created by Vaibhav Gawde on 13/06/23.
//

import Foundation
import UIKit

class UIChanges {
 
    
    
    var alert : UIAlertController!
    
    func uiViewRound(view: UIView, value: Int){
        view.clipsToBounds = false
        view.layer.cornerRadius = CGFloat(value)
        
    }
    
    
    func uiButtonRound(button : UIButton){
        button.clipsToBounds = true
        button.layer.cornerRadius = 16
    }
    
    
    func loader() -> UIAlertController {
        
        alert = UIAlertController(title: nil, message: "Please Wait", preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.large
        loadingIndicator.startAnimating()
        alert.view.addSubview(loadingIndicator)
        return alert
        //present(alert, animated: true,completion: nil)
        
    }
    
    
    func stopLoader(alert: UIViewController){

            DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                if alert != nil{
                    alert.dismiss(animated: true)
                }
                
            })
    }
}
