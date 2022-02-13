//
//  MovieTableView.swift
//  MovieApp
//
//  Created by Vladislav Nikolaychuk on 11.02.2022.
//

import Foundation
import UIKit

class MovieTableView: UITableView {
    var movies: [Movie] = [] 
    var loadNewPage: ((Int) -> Void)?
    var pageCount = 1
}

extension MovieTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell",
                                                    for: indexPath) as? MovieCell {
            let movie = movies[indexPath.row]
            cell.setupData(movie: movie)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastSectionIndex = tableView.numberOfSections - 1
        let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
        if indexPath.section ==  lastSectionIndex && indexPath.row == lastRowIndex {
            self.tableFooterView?.isHidden = false
            pageCount += 1
            self.loadNewPage?(pageCount)
        }
    }
}
