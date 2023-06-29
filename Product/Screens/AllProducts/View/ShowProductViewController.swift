//
//  ShowProductViewController.swift
//  Product
//
//  Created by Vaibhav Gawde on 13/06/23.
//

import UIKit

class ShowProductViewController: UIViewController {
    
    
   
    @IBOutlet weak var productTableView: UITableView!
    var serviceCall = ServiceCall()
    var productData = [ProductResponse]()
    var alert : UIAlertController?
    
    var productVM = GetProductsVM()
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configuration()
       
     
        
        
        
    }

}


extension ShowProductViewController {
    
    func configuration(){
        productTableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier:
        "ProductCell")
        
        productTableView.separatorStyle = .none
        initViewModel()
        observeEvents()
        
    }
    
    
    func initViewModel(){
        productVM.fetcProducts()
        
    }
    
    func observeEvents(){
        
        productVM.eventHandler = {
            
            [weak self] event in
            guard let self else{
                return
            }
            
            switch event{
                
            case .loading:
                print("Loadig")
//                DispatchQueue.main.async {
//                    self.alert = UIChanges().loader()
//                    self.present(self.alert!, animated: true)
//                }
            case .stopLoading:
                print("Stop Loadig")
//                DispatchQueue.main.async {
//                    UIChanges().stopLoader(alert: self.alert!)
//                }
                
            case .dataLoaded:
                self.productData = self.productVM.productList
                DispatchQueue.main.async {
                    self.productTableView.reloadData()
                }
                
            case .error(let error):
                print(error)
            }
        }
        
    }
}


extension ShowProductViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productTableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
        
        cell.idLabel.text = String(productData[indexPath.row].id)
        cell.priceLabel.text = String(productData[indexPath.row].price)
        cell.titleLabel.text = productData[indexPath.row].title
        
        return cell
        
        
        
    }
    
    
}
