//
//  Movie.swift
//  MovieApp
//
//  Created by Vladislav Nikolaychuk on 11.02.2022.
//

import Foundation

struct MovieList: Codable {
    var page: Int
    var results: [Movie]
}

