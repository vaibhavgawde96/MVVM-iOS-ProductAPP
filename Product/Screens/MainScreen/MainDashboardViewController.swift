//
//  MainDashboardViewController.swift
//  Product
//
//  Created by Vaibhav Gawde on 13/06/23.
//

import UIKit

class MainDashboardViewController: UIViewController {
    
    @IBOutlet weak var prodView: UIView!
    @IBOutlet weak var categoriesView: UIView!
    @IBOutlet weak var newProdView: UIView!
    @IBOutlet weak var deleteProdView: UIView!
    
    let uiChanges = UIChanges()
    var storyBoard: UIStoryboard!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiChanges.uiViewRound(view: prodView, value: 32)
        uiChanges.uiViewRound(view: categoriesView, value: 32)
        uiChanges.uiViewRound(view: newProdView, value: 32)
        uiChanges.uiViewRound(view: deleteProdView, value: 32)
        self.navigationItem.hidesBackButton = true
        
        storyBoard = UIStoryboard(name: "Main", bundle: nil)

       
    }
    
    
    
    @IBAction func showProductAction(_ sender: Any) {
        
        let newVC = storyBoard.instantiateViewController(identifier: "ShowProductVC") as! ShowProductViewController
        
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    

    @IBAction func showCategoriesAction(_ sender: Any) {
        
        let newVC = storyBoard.instantiateViewController(identifier: "AllCaregoriesVC") as! AllCategoriesViewController
        
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    
    @IBAction func addProductAction(_ sender: Any) {
        
        let newVC = storyBoard.instantiateViewController(identifier: "NewProductVC") as! NewProductViewController
        
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    
    
    @IBAction func deleteProductAction(_ sender: Any) {
        
        let newVC = storyBoard.instantiateViewController(identifier: "DeleteProductVC") as! DeleteProductViewController
        
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    
}
