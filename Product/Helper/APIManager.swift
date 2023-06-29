//
//  APIManager.swift
//  Product
//
//  Created by Vaibhav Gawde on 28/06/23.
//

import Foundation


enum DataError : Error {
   case invalidResponse
   case invalidURL
   case invalidDecoding
   case netwrok(Error?)
}


final class APIManager{
    
    
    static let shared = APIManager()
    
    typealias handler<T> = Result<T,DataError>
    
    private init(){}
    
    
    func apiRequest<T: Codable>(
        modelType: T.Type,
        urlEndPoints : Endpoints,
        completion: @escaping (handler<T>) -> Void){
        
        guard let url = urlEndPoints.url else {
            completion(.failure(.invalidURL))
            return
        }
            
            
            print(url)
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = urlEndPoints.methodName.rawValue
        
        if let parameters = urlEndPoints.requestBody {
            urlRequest.httpBody = try? JSONEncoder().encode(parameters)
        }
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data,error == nil else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let responseCode = response as? HTTPURLResponse,
                  200 ... 299 ~= responseCode.statusCode else {
                completion(.failure(.invalidDecoding))
                return
            }
            
            do{
                
                let responseData = try JSONDecoder().decode(modelType.self, from: data)
                print(responseData)
                completion(.success(responseData))
                
            }catch{
                completion(.failure(.netwrok(error)))
                return
            }
        }.resume()
        
    }
}
