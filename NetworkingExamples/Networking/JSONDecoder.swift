//
//  JSONDecoder.swift
//  NetworkingExamples
//
//  Created by Josh R on 5/1/20.
//  Copyright © 2020 Josh R. All rights reserved.
//

import Foundation


extension JSONDecoder {
    func fetch<T: Decodable>(urlString: String, completion: @escaping  (Result<T, Error>) -> ()) {
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            do {
                let response = try JSONDecoder().decode(T.self, from: data!)
                completion(.success(response))
            } catch let err {
                completion(.failure(err))
            }
        }.resume()
    }
}
