//
//  ProductResponse.swift
//  Product
//
//  Created by Vaibhav Gawde on 13/06/23.
//

import Foundation


struct Response : Codable{
    let result : ProductResponse
}


struct ProductResponse : Codable{
    let id: Int
    let title: String
    let price: Double
    let category: String
    let description: String
    let image: String
    
    init(id: Int, title: String, price: Double, category: String, description: String, image: String) {
        self.id = id
        self.title = title
        self.price = price
        self.category = category
        self.description = description
        self.image = image
    }
}
