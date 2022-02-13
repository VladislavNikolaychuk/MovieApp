//
//  MovieViewController.swift
//  MovieApp
//
//  Created by Vladislav Nikolaychuk on 11.02.2022.
//

import UIKit

class MovieViewController: UIViewController {
    
    @IBOutlet weak var tableView: MovieTableView!
    var presenter: MoviePresenterProtocol!
    let loader = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        self.presenter.getMovies(page: 1)
        self.tableView.loadNewPage = { [weak self] page in
            guard let self = self else {return}
            self.tableView.tableFooterView?.isHidden = false
            self.presenter.getMovies(page: page)
        }
    }
    
    func setupLayout() {
        let cellNib = UINib(nibName: "MovieCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier:
                            "MovieCell")
        tableView.delegate = tableView
        tableView.dataSource = tableView
        tableView.tableFooterView = loader
        loader.startAnimating()
        loader.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: UIScreen.main.bounds.width, height: CGFloat(44))
    }
}

extension MovieViewController: MovieViewProtocol {
    
    func updateTableView(movies: [Movie]) {
        let startPoint = tableView.movies.count
          tableView.movies.append(contentsOf: movies)
          let indexPathes = Array(0..<movies.count).map { IndexPath(row: startPoint + $0, section: 0) }
          tableView.insertRows(at: indexPathes, with: .bottom)
          tableView.tableFooterView?.isHidden = true
     }
    
    func showAlert(errorMessage: String) {
        let alert = UIAlertController(title: "Failed to load", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
        tableView.tableFooterView?.isHidden = true
    }
}
