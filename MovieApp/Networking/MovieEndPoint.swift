//
//  MovieEndPoint.swift
//  MovieApp
//
//  Created by Vladislav Nikolaychuk on 11.02.2022.
//

import Moya


enum MovieEndPoint {
    case getMovies(page: Int)
    
}

extension MovieEndPoint: TargetType {
    var sampleData: Data { Data() }
    
    var baseURL: URL {
        switch self {
        case .getMovies:
            return URL(string: "https://api.themoviedb.org/3")!
        }
        
    }
    
    var path: String {
        switch self {
        case .getMovies:
            return "/movie/popular"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMovies:
            return .get
        }
    }
    
    var headers: [String: String]? {
        var headers: [String: String] = [:]
        switch self {
        case .getMovies:
            headers[HTTPHeader.contentType] = HTTPContentType.json
        return headers
        }
    }
    
    var task: Task {
        switch self {
        case .getMovies(let model):
            let urlParameters: [String: Any] = [
                "page": model,
                "api_key": "6836022cd3a537c2d58824bceb03ae67"
            ]
            return .requestParameters(parameters: urlParameters, encoding: URLEncoding.default)
            }
        }
    
    private enum HTTPHeader {
        static let contentType = "Content-Type"
    }

    private enum HTTPContentType {
        static let json = "application/json"
    }
}
