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
//    let voteAverage: Double
//    let releaseDate: String
    var posterURL: URL {
       return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
   }
//
    var backdropURL: URL {
       return URL(string: "https://image.tmdb.org/t/p/original\(backdropPath ?? "")")!
   }
//
//    var voteAveragePercentText: String {
//       return "\(Int(voteAverage * 10))% / 100%"
//   }
    
}
