//
//  NetworkResponseParser.swift
//  MovieApp
//
//  Created by Vladislav Nikolaychuk on 11.02.2022.
//

import Moya
import Foundation

enum ServerResult<T> {
    case success(T)
    case failure(String)
}

class NetworkResponseParser {
    
    static func parse<T: Decodable>(result: Result<Moya.Response, MoyaError>,
                                    completion: @escaping (ServerResult<T>) -> Void) {
        switch result {
        case .success(let response):
            debugPrint(response, T.self)
            do {
                let results = try JSONDecoder().decode(T.self, from: response.data)
                completion(.success(results))
            } catch {
                completion(.failure(error.localizedDescription))
            }
        case .failure(let error):
            completion(.failure(error.localizedDescription))
        }
    }
    
}
