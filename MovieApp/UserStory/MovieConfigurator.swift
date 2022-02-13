//
//  MovieConfigurator.swift
//  MovieApp
//
//  Created by Vladislav Nikolaychuk on 11.02.2022.
//

import UIKit

class MovieConfigurator {
    static func create() -> UIViewController {
        let view = MovieViewController()
        let presenter = MoviePresenter()
        let router = MovieRouter()
        let interactor = MovieInteractor()
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        return view
    }
}


