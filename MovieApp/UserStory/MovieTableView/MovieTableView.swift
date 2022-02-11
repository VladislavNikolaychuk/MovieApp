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
    
}

extension MovieTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell",
                                                    for: indexPath) as? MovieCell {
            let movie = movies[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
    
    
    
}
