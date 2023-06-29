//
//  AddProductRequest.swift
//  Product
//
//  Created by Vaibhav Gawde on 15/06/23.
//

import Foundation

struct AddProductRequest : Encodable {
    
    let title: String
    let price: String
    let description: String
    let image: String
    let category: String
    
    
    init(title: String, price: String, description: String, image: String, category: String) {
        self.title = title
        self.price = price
        self.description = description
        self.image = image
        self.category = category
    }
}
