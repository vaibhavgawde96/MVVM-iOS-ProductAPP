//
//  URLConfig.swift
//  Product
//
//  Created by Vaibhav Gawde on 28/06/23.
//

import Foundation


enum HttpMethods : String{
    case get  = "GET"
    case post = "POST"
}

//url configuration protocol
protocol Endpoints {
    var url:  URL?  { get } //final url
    var baseURL: String { get } //base url
    var methodName: HttpMethods { get } // get/post
    var requestBody: Encodable? { get } //requestBody
    
}


//all the api methods which we are going to call
enum MethodName  {
    case getAllProduct
    case addProduct(productRequest : AddProductRequest)
    case getCategories
    case getProductByCaegories(category: String)
    case deleteProduct(id : String)
}


//combining api methods and url configuration to get the url according to the api methods
extension MethodName : Endpoints {
    var url: URL? {
        switch self{
        case .getAllProduct:
            return URL(string:baseURL)
            
        case .addProduct:
            return URL(string:baseURL)
        
        case .getProductByCaegories(category: let category):
            return URL(string: "\(baseURL)/category/\(category)")
       
        case .deleteProduct(id: let id):
            return URL(string: "\(baseURL)\(id)")
            
        case .getCategories:
            return URL(string: "\(baseURL)/categories")
        }
    }
    
    var baseURL: String {
        return "https://fakestoreapi.com/products"
    }
    
    var methodName: HttpMethods {
        switch self{
        case .getAllProduct:
            return .get
        case .addProduct:
            return .post
        case .getProductByCaegories:
            return .get
        case .deleteProduct:
            return .get
        case .getCategories:
            return .get
        }
    }
    
   
    
    var requestBody: Encodable? {
        switch self{
            
        case .getAllProduct:
            return nil
            
        case .addProduct(productRequest: let productRequest):
            return productRequest
            
        case .getProductByCaegories:
            return nil
            
        case .deleteProduct:
            return nil
            
        case .getCategories:
            return nil
        }
    }
}


