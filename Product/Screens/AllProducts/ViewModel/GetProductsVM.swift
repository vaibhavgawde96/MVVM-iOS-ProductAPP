//
//  GetProductsVM.swift
//  Product
//
//  Created by Vaibhav Gawde on 28/06/23.
//

import Foundation


final class GetProductsVM {
    
    var eventHandler : ((_ events : Events) -> Void)?
    var productList : [ProductResponse] = []
    
    
    func fetcProducts() {
        
        APIManager.shared.apiRequest(modelType: [ProductResponse].self, urlEndPoints: MethodName.getAllProduct) { response in
            self.eventHandler?(.stopLoading)
            switch response {
               
                case .success(let productsList):
                    self.productList = productsList
                    self.eventHandler?(.dataLoaded)
                    
                    
                case .failure(let error):
                    self.eventHandler?(.error(error))
                    print(error)
                
            }
        }
    }
    
}




