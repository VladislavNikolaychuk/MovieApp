//
//  MovieViewController.swift
//  MovieApp
//
//  Created by Vladislav Nikolaychuk on 11.02.2022.
//

import UIKit

class MovieViewController: UIViewController {
    
    @IBOutlet weak var tableView: MovieTableView!
    weak var presenter: MoviePresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    
    func setupLayout() {
        let cellNib = UINib(nibName: "MovieCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier:
                                    "MovieCell")
        tableView.delegate = tableView
        tableView.dataSource = tableView
    }
}

extension MovieViewController: MovieViewProtocol {
    
}
