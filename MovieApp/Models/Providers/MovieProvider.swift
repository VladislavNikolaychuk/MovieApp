//
//  MovieProvider.swift
//  MovieApp
//
//  Created by Vladislav Nikolaychuk on 11.02.2022.
//

import Moya

class MovieProvider {
    
    private let networkManager = MoyaProvider<MovieEndPoint>()
    weak var delegate: MovieProviderProtocol?
    
    func getMovies(page: Int) {
        networkManager.request(.getMovies(page: page)) { (response) in
            NetworkResponseParser.parse(result: response,
                                        completion: { (parseResult: ServerResult<MovieList>) in
                switch parseResult {
                case .success(let requestResult):
                    self.delegate?.getMovies(movies: requestResult.results)
                    break
                case .failure(let error):
                    self.delegate?.movieDownloadError(error: error.debugDescription)
                    break
                }
            })
        }
    }
    
}
