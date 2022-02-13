//
//  MovieCell.swift
//  MovieApp
//
//  Created by Vladislav Nikolaychuk on 11.02.2022.
//

import UIKit
import Kingfisher

class MovieCell: UITableViewCell {
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var overview: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupData(movie: Movie) {
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath)")
        self.movieImage.kf.setImage(with: url)
        self.titleLabel.text = movie.originalTitle
        self.overview.text = movie.overview
        self.releaseDate.text = movie.releaseDate
    }
    
}
