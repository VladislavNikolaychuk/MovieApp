//
//  MovieInteractor.swift
//  MovieApp
//
//  Created by Vladislav Nikolaychuk on 11.02.2022.
//

import Foundation

class MovieInteractor: MovieInteractorInputProtocol {
    weak var presenter: MovieInteractorOutputProtocol!
    var movieProvider = MovieProvider()
    
    init() {
        movieProvider.delegate = self
    }
}

extension MovieInteractor: MovieProviderProtocol {
    func movieDownloadError(error: String) {
        self.presenter.movieDownloadError(error: error)
    }
    
    func getMovies(movies: [Movie]) {
        self.presenter.getMovies(movies: movies)
    }
}
