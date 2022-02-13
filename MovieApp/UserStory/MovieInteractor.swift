//
//  MovieInteractor.swift
//  MovieApp
//
//  Created by Vladislav Nikolaychuk on 11.02.2022.
//

import Foundation

class MovieInteractor: MovieInteractorInputProtocol {
    
    weak var presenter: MovieInteractorOutputProtocol!
    let movieProvider = MovieProvider()
    
    init() {
        movieProvider.delegate = self
    }
    
    func getMovies(page: Int) {
        self.movieProvider.getMovies(page: page)
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
