//
//  NewProductViewController.swift
//  Product
//
//  Created by Vaibhav Gawde on 13/06/23.
//

import UIKit

class NewProductViewController: UIViewController {
   
    

    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var discriptionTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var parentView: UIView!
    
    @IBOutlet weak var submitButton: UIButton!
    let uiChanges = UIChanges()
    var addProductRequest : AddProductRequest!
    var serviceCall = ServiceCall()
    var newProductVM = AddProductVM()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiChanges.uiViewRound(view: parentView, value: 16)
        uiChanges.uiButtonRound(button: submitButton)

        
    }
    
    @IBAction func addProduct(_ sender: UIButton) {
        if(validation()){
            addProductRequest = AddProductRequest(title: titleTextField.text!, price: priceTextField.text!, description: discriptionTextField.text!, image: "https://i.pravatar.cc", category: categoryTextField.text!)
            
            newProductVM.addNewProduct(productRequest: addProductRequest)
            observer()
            
        }
        
    }
    
    
    func observer(){
        
        newProductVM.eventHandler = {
            [weak self] events in
            guard let self else{
                return
            }
            
            switch events {
                
            case .loading:
                print("Loading")
            case .stopLoading:
                print("Stop Loading")
            case .dataLoaded:
                print(self.newProductVM.productResponse)
            case .error(let error):
                print(error)
            }
        }
        
    }
    
    
    
    
    
    func validation() -> Bool{
        
        if(titleTextField.text == ""){
            print("Please enter title")
            return false
        }
        if(priceTextField.text == ""){
            print("Please enter price")
            return false
        }
        if(discriptionTextField.text == ""){
            print("Please enter Description")
            return false
        }
        if(categoryTextField.text == ""){
            print("Please enter categories")
            return false
        }
        
        return true
        
    }
   
    

}
