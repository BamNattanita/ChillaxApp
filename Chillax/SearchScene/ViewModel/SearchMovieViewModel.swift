//
//  SearchMovieViewModel.swift
//  Chillax
//
//  Created by Nattanita on 16/8/2564 BE.
//

import Foundation

protocol ISearchMovieViewModel {

    var id: Int { get }
    var title: String { get }
    var releaseDate: String { get }
    var posterURL: URL? { get }
    var backdropURL: URL? { get }
    var voteAverage: Double {get}
    var voteRating: String {get}
    var genres: [Genre]? {get}
}

struct SearchMovieViewModel: ISearchMovieViewModel {
    let id: Int
    let title: String
    let releaseDate: String
    let posterURL: URL?
    let backdropURL: URL?
    let genres: [Genre]?
    let voteAverage: Double
    let voteRating: String
    
}

extension SearchMovieViewModel {
    init?(searchMovie: SearchMovie?) {
        if let searchMovie = searchMovie {
        self.id = searchMovie.id
        self.title = searchMovie.title
        releaseDate = searchMovie.releaseDate
        posterURL = searchMovie.posterURL
        backdropURL = searchMovie.backdropURL
        voteRating = searchMovie.voteRating
        voteAverage = searchMovie.voteAverage
        genres = searchMovie.genres
        } else {
            return nil
        }
    }
}
