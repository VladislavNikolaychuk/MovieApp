//
//  MovieProtocols.swift
//  MovieApp
//
//  Created by Vladislav Nikolaychuk on 11.02.2022.
//

import Foundation


protocol MoviePresenterProtocol: AnyObject {
    var interactor: MovieInteractorInputProtocol! {get set}
    var view: MovieViewProtocol! {get set}
    var router: MovieRouterProtocol! {get set}
}

protocol MovieViewProtocol: AnyObject {
    var presenter: MoviePresenterProtocol! {get set}
    
}

protocol MovieInteractorOutputProtocol: AnyObject {
    func getMovies(movies: [Movie])
    func movieDownloadError(error: String)
    
}

protocol MovieInteractorInputProtocol: AnyObject {
    var presenter: MovieInteractorOutputProtocol! {get set}
    func getMovies(movies: [Movie])
}

protocol MovieRouterProtocol: AnyObject {
    
}

protocol MovieProviderProtocol: AnyObject {
    func getMovies(movies: [Movie])
    func movieDownloadError(error: String)
}


