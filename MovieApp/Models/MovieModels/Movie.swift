//
//  Movie.swift
//  MovieApp
//
//  Created by Vladislav Nikolaychuk on 11.02.2022.
//

import Foundation

struct Movie: Codable {
    var posterPath: String
    var overview: String
    var releaseDate: String
    var id: Int
    var originalTitle: String
    
    private enum CodingKeys : String, CodingKey {
        case posterPath = "poster_path"
        case overview
        case releaseDate = "release_date"
        case id
        case originalTitle = "original_title"
    }
}

