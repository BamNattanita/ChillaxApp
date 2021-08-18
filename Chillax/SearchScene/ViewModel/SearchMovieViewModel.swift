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
//    var releaseDate: String { get }
    var posterURL: URL? { get }
    var backdropURL: URL? { get }
//    var overview: String {get}
//    var voteAverage: Double {get}
//    var voteAveragePercentText: String {get}

}

struct SearchMovieViewModel : ISearchMovieViewModel {
    
    let id: Int
    let title: String
//    let releaseDate: String
    let posterURL: URL?
    let backdropURL: URL?
//    let overview: String
//    let voteAverage: Double
//    let voteAveragePercentText: String
//    let voteAverage: Double
    
}

extension SearchMovieViewModel {
    init?(searchMovie: SearchMovie?) {
        if let searchMovie = searchMovie {
        self.id = searchMovie.id
        self.title = searchMovie.title
//        releaseDate = searchMovie.releaseDate
        posterURL = searchMovie.posterURL
        backdropURL = searchMovie.backdropURL
//        overview = searchMovie.overview
//        voteAverage = searchMovie.voteAverage
//        voteAveragePercentText = searchMovie.voteAveragePercentText
        } else {
            return nil
        }
    }
}
