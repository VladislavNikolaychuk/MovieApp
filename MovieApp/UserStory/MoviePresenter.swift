//
//  MoviePresenter.swift
//  MovieApp
//
//  Created by Vladislav Nikolaychuk on 11.02.2022.
//

import Foundation

class MoviePresenter {
    var interactor: MovieInteractorInputProtocol!
    var view: MovieViewProtocol!
    var router: MovieRouterProtocol!
}

extension MoviePresenter: MoviePresenterProtocol {
    
}

extension MoviePresenter: MovieInteractorOutputProtocol {
    func getMovies(movies: [Movie]) {
        
    }
    
    func movieDownloadError(error: String) {
    }
    
}
