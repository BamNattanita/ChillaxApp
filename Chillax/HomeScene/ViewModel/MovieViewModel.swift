//
//  MovieViewModel.swift
//  Chillax
//
//  Created by Nattanita on 5/8/2564 BE.
//

import Foundation

protocol IMovieViewModel {
    var id: Int {get}
    var title: String { get }
    var releaseDate: Date { get }
    var posterURL: URL? { get }
    var backdropURL: URL? { get }
    var overview: String {get}
    var voteAverage: Double {get}
}

struct MovieViewModel: IMovieViewModel {
    let id: Int
    let title: String
    let releaseDate: Date
    let posterURL: URL?
    let backdropURL: URL?
    let overview: String
    let voteAverage: Double
}

extension MovieViewModel {
    init(movie: Movie) {
        self.id = movie.id
        self.title = movie.title
        releaseDate = movie.releaseDate
        posterURL = movie.posterURL
        backdropURL = movie.backdropURL
        overview = movie.overview
        voteAverage = movie.voteAverage
    }
}
