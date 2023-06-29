//
//  GetCategoriesVM.swift
//  Product
//
//  Created by Vaibhav Gawde on 29/06/23.
//

import Foundation


final class GetCategoriesVM{
    
    var eventHandler : ((_ events : Events) -> Void)?
    var categoriesList : [String] = []
    var productList : [ProductResponse] = []
    
    
    
    
    func fetchCategories(){
        
        APIManager.shared.apiRequest(modelType: [String].self, urlEndPoints: MethodName.getCategories) { response in
            
            self.eventHandler?(.stopLoading)
            switch response {
                
            case .success(let responseData):
                self.categoriesList = responseData
                self.eventHandler?(.dataLoaded)
                
            case .failure(let error):
                self.eventHandler?(.error(error))
                print(error)
            }
        }
    }
    
    func fetchProductsByCategories(categorie: String){
        
        APIManager.shared.apiRequest(modelType: [ProductResponse].self, urlEndPoints: MethodName.getProductByCaegories(category: categorie)) { response in
            
            self.eventHandler?(.stopLoading)
            switch response{
            
                
            case .success(let response):
                self.productList = response
                self.eventHandler?(.dataLoaded)
                
                
            case .failure(let error):
                self.eventHandler?(.error(error))
                print(error)
                
            }
            
        }
        
    }
    
    
}
