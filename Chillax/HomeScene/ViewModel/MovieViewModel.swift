//
//  MovieViewModel.swift
//  Chillax
//
//  Created by Nattanita on 5/8/2564 BE.
//

import Foundation

protocol IMovieViewModel {
    
    var title: String { get }
    var releaseDate: Date { get }
    var posterURL: URL? { get }
    var backdropURL: URL? { get }

}

struct MovieViewModel: IMovieViewModel {
    
    let title: String
    let releaseDate: Date
    let posterURL: URL?
    let backdropURL: URL?
    
}

extension MovieViewModel {
    init(movie: Movie) {
        self.title = movie.title
        releaseDate = movie.releaseDate
        posterURL = movie.posterURL
        backdropURL = movie.backdropURL
    }
}
