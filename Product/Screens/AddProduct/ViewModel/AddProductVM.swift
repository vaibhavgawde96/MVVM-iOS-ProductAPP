//
//  AddProductVM.swift
//  Product
//
//  Created by Vaibhav Gawde on 29/06/23.
//

import Foundation


final class AddProductVM{
    
    var eventHandler : ((_ event : Events) -> Void)?
    var productResponse : ProductResponse?
    
    
    func addNewProduct(productRequest : AddProductRequest){
        
        APIManager.shared.apiRequest(modelType: ProductResponse.self, urlEndPoints: MethodName.addProduct(productRequest: productRequest)) { response in
            
            self.eventHandler?(.stopLoading)
            
            switch response {
                
            case .success(let responseData):
                self.productResponse = responseData
                self.eventHandler?(.dataLoaded)
                
                
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
        }
    }
}
