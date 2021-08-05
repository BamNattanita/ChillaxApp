////
////  Movie.swift
////  Chillax
////
////  Created by Nattanita on 3/8/2564 BE.
////
//
////import Foundation
////import UIKit
//
////protocol IMovie {
////    var id: String { get }
////    var name: String { get }
////}
//
////struct Movie: IMovie {
////    var id: String
////    var name: String
////}
//
////struct Movie {
////    let title: String
////    let image: UIImage
////}
////
////let movies: [Movie] = [
////    Movie(title: "Rick And Morty", image: #imageLiteral(resourceName: "rickandmorty")),
////    Movie(title: "John Wick", image: #imageLiteral(resourceName: "johnwick")),
////    Movie(title: "Avatar", image: #imageLiteral(resourceName: "avatar")),
////    Movie(title: "Quiet Place", image: #imageLiteral(resourceName: "quietplace")),
////    Movie(title: "Fast And Furious", image: #imageLiteral(resourceName: "fastandfurios9")),
////    Movie(title: "Avengers", image: #imageLiteral(resourceName: "avengers")),
////    Movie(title: "Hightown", image: #imageLiteral(resourceName: "hightown"))]
//
////   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)
//
//import Foundation
//
//struct MovieResult: Codable {
//    let dates: Dates
//    let page: Int
//    let results: [Result]
//    let totalPages, totalResults: Int
//
//    enum CodingKeys: String, CodingKey {
//        case dates, page, results
//        case totalPages = "total_pages"
//        case totalResults = "total_results"
//    }
//}
//
//// MARK: - Dates
//struct Dates: Codable {
//    let maximum, minimum: String
//}
//
//// MARK: - Result
//struct Result: Codable {
//    let adult: Bool
//    let backdropPath: String?
//    let genreIDS: [Int]
//    let id: Int
//    let originalLanguage: OriginalLanguage
//    let originalTitle, overview: String
//    let popularity: Double
//    let posterPath, releaseDate, title: String
//    let video: Bool
//    let voteAverage: Double
//    let voteCount: Int
//
//    enum CodingKeys: String, CodingKey {
//        case adult
//        case backdropPath = "backdrop_path"
//        case genreIDS = "genre_ids"
//        case id
//        case originalLanguage = "original_language"
//        case originalTitle = "original_title"
//        case overview, popularity
//        case posterPath = "poster_path"
//        case releaseDate = "release_date"
//        case title, video
//        case voteAverage = "vote_average"
//        case voteCount = "vote_count"
//    }
//}
//
//enum OriginalLanguage: String, Codable {
//    case en = "en"
//}
