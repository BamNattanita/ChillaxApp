//
//  MovieDetailsWorker.swift
//  Chillax
//
//  Created by Nattanita on 11/8/2564 BE.
//

import Foundation

protocol IDetailWorker {
    func getDetail( id: Int, completion: @escaping (Result<MovieDetails?, Error>) -> Void)
    func addToCart (movieDetails: MovieDetails, completion: @escaping (Result<Bool, Error>) -> Void)
}

struct DetailWorker {
    let remoteStore: DetailRemoteStore
    let basketStoreKey = "basketMovies"
}

// MARK: - IHomeWorker
extension DetailWorker: IDetailWorker {
    func getDetail( id: Int, completion: @escaping (Result<MovieDetails?, Error>) -> Void) {
        remoteStore.details(id: id, completion: completion)
    }
    
    
    func addToCart (movieDetails: MovieDetails, completion: @escaping (Result<Bool, Error>) -> Void){
        var moviesInCart = loadCart()
        moviesInCart.append(movieDetails)
        UserDefaults.standard.setValue(moviesInCart, forKey: basketStoreKey)
        completion(.success(true))

        
    }
    
    func loadCart() -> [MovieDetails]{
            if let data = UserDefaults.standard.data(forKey: basketStoreKey) {
        
                let decoder = JSONDecoder()
        
                guard let movies = try? decoder.decode([MovieDetails].self, from: data) else {
        
                    return []
        
                }
                return movies
            }
        
        return []
        
    }
    

}

//var movies: [MovieDetails] = []
//for items in movieResponse {
//    let movie = Movie(id: items.id, title: items.title)
//    movies.append(movie)
//}
//
//
//let basketStoreKey = "basketMovies"
//
//func saveMovieInBasket(movie: Movie) {
//
//    var currentMoviesInBasket = loadMoviesInBasket()
//
//    currentMoviesInBasket.append(movie)
//
//
//
//    // Save [Movie]
//
//    UserDefaults.standard.setValue(currentMoviesInBasket, forKey: basketStoreKey)
//
//}
//
//
//
//func loadMoviesInBasket() -> [Movie] {
//
//    // Load in basket scene -> [Movie]
//
//    if let data = UserDefaults.standard.data(forKey: basketStoreKey) {
//
//        let decoder = JSONDecoder()
//
//        guard let movies = try? decoder.decode([Movie].self, from: data) else {
//
//            return []
//
//        }
//
//
//
//        return movies
//
//    }
//
//
//
//    return []
//
//}
