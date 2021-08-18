//
//  MovieDetailsViewModel.swift
//  Chillax
//
//  Created by Nattanita on 10/8/2564 BE.
//

import Foundation

protocol IMovieDetailsViewModel {

//    var id: Int { get }
//    var title: String { get }
//    var releaseDate: String { get }
//    var posterURL: URL? { get }
//    var backdropURL: URL? { get }
//    var overview: String {get}
//    var voteAverage: Double {get}
//    var voteAveragePercentText: String {get}
//    var originalLanguage: String {get}
    var movieDetail: MovieDetails? {get}
}

struct MovieDetailsViewModel : IMovieDetailsViewModel {
    
//    var id: Int
//    let title: String
//    let releaseDate: String
//    let posterURL: URL?
//    let backdropURL: URL?
//    let overview: String
//    let voteAverage: Double
//    let voteAveragePercentText: String
////    let voteAverage: Double
//    let originalLanguage: String
    var movieDetail: MovieDetails?
    
}

//extension MovieDetailsViewModel {
//    init?(movieDetails: MovieDetails?) {
//        if let movieDetails = movieDetails {
//        self.id = movieDetails.id
//        self.title = movieDetails.title
//        releaseDate = movieDetails.releaseDate
//        posterURL = movieDetails.posterURL
//        backdropURL = movieDetails.backdropURL
//        overview = movieDetails.overview
//        voteAverage = movieDetails.voteAverage
//        voteAveragePercentText = movieDetails.voteAveragePercentText
//        originalLanguage = movieDetails.originalLanguage
//        } else {
//            return nil
//        }
//    }
//}
