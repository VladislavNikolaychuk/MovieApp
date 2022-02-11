//
//  Movie.swift
//  MovieApp
//
//  Created by Vladislav Nikolaychuk on 11.02.2022.
//

import Foundation

struct Movie: Codable {
    var poster_path: String
    var overview: String
    var release_date: String
    var id: Int
    var original_title: String
}

