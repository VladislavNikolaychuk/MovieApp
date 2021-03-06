//
//  MoviePresenter.swift
//  MovieApp
//
//  Created by Vladislav Nikolaychuk on 11.02.2022.
//

import Foundation

class MoviePresenter {
    var interactor: MovieInteractorInputProtocol!
    weak var view: MovieViewProtocol!
    var router: MovieRouterProtocol!
}

extension MoviePresenter: MoviePresenterProtocol {
    func getMovies(page: Int) {
        self.interactor.getMovies(page: page)
    }
}

extension MoviePresenter: MovieInteractorOutputProtocol {
    func getMovies(movies: [Movie]) {
        self.view.updateTableView(movies: movies)
    }
    
    func movieDownloadError(error: String) {
        self.view.showAlert(errorMessage: error)
    }
    
}
