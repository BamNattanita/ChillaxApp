//
//  SearchMovieModel.swift
//  Chillax
//
//  Created by Nattanita on 16/8/2564 BE.
//

import Foundation

struct SearchResultResponse: Codable{
    var results : [SearchMovie]
}

struct SearchMovie: Codable {
    let id : Int
    let title : String
    let overview: String
    let backdropPath: String?
    let posterPath: String?
    let voteAverage: Double
    let genres: [Genre]?
    let releaseDate: String
    var posterURL: URL {
       return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
   }

    var backdropURL: URL {
       return URL(string: "https://image.tmdb.org/t/p/original\(backdropPath ?? "")")!
   }

    var voteRating: String {
        return "⭐️ \(Double(voteAverage)) / 10"
    }
}

struct Genre: Codable {
   let name: String
}
